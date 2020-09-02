//
//	ViewController.m
// 	WeatherApp-ObjC
//

#import "ViewController.h"
#import "MainView.h"
#import "Forecast.h"
#import "NetworkService.h"
#import "APIConstants.h"
#import "TableViewCell.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.mainView = ((MainView *) self.view);
    self.mainView.tableViewDataSource = self;
    self.mainView.tableViewDelegate = self;
    
    self.networkService = [NetworkService new];
    
    __weak typeof(self)weakSelf = self;
    [self.networkService dailyForecastRequestWithLatitude:FakeRegion.latitude
                                        andLongitude:FakeRegion.longitude
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
    Forecast *todayForecast = self.forecastsArray.firstObject;
    
    [self.mainView showForecastWithDate:todayForecast.dateString region:FakeRegion.name
                           temperature:todayForecast.temperature description:todayForecast.weatherDescription
                       systemImageName:todayForecast.systemImageName];
}

// MARK: - UITableViewDelegate, UITableViewDataSource

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    TableViewCell *cell = ((TableViewCell *) [tableView dequeueReusableCellWithIdentifier: TableViewCell.CellReuseID]);
    Forecast *forecast = self.forecastsArray[indexPath.row + 1];
    
    [cell configureWithDate:forecast.dateString systemImageName:forecast.systemImageName temperature:forecast.temperature];
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.forecastsArray.count - 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

@end
