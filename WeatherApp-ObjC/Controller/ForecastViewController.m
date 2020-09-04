//
//	ViewController.m
// 	WeatherApp-ObjC
//

#import "ForecastViewController.h"
#import "MainView.h"
#import "Forecast.h"
#import "NetworkService.h"
#import "APIConstants.h"
#import "ForecastTableViewCell.h"

static const NSInteger kCellHeightForRow = 50;

@interface ForecastViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) MainView *mainView;
@property (nonatomic) NSArray<Forecast *> *forecastsArray;
- (void) refreshViews;

@end

@implementation ForecastViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.mainView = ((MainView *) self.view);
    self.mainView.tableViewDataSource = self;
    self.mainView.tableViewDelegate = self;
    
    self.networkService = [NetworkService new];
    
    __weak typeof(self)weakSelf = self;
    [self.networkService dailyForecastRequestWithLatitude:FakeRegionLatitude
                                        andLongitude:FakeRegionLongitude
                                      withCompletion:^(NSArray<Forecast *> *forecasts) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            __strong typeof(self) self = weakSelf;
            self.forecastsArray = forecasts;
            [self refreshViews];
        });
    }];
}

- (void)refreshViews
{
    Forecast *todayForecast = _forecastsArray.firstObject;
    
    [self.mainView showForecastWithDate:todayForecast.dateString region:FakeRegionName
                           temperature:todayForecast.temperature description:todayForecast.weatherDescription
                       systemImageName:todayForecast.systemImageName];
}

// MARK: - UITableViewDelegate, UITableViewDataSource

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    ForecastTableViewCell *cell = ((ForecastTableViewCell *) [tableView dequeueReusableCellWithIdentifier: ForecastTableViewCellReuseID]);
    Forecast *forecast = _forecastsArray[indexPath.row + 1];
    
    [cell configureWithDate:forecast.dateString systemImageName:forecast.systemImageName temperature:forecast.temperature];
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _forecastsArray.count - 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kCellHeightForRow;
}

@end
