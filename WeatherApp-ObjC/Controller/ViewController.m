//
//	ViewController.m
// 	WeatherApp-ObjC
//

#import "ViewController.h"
#import "MainView.h"
#import "Forecast.h"
#import "NetworkService.h"
#import "APIConstants.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.mainView = ((MainView *) self.view);
    
    NetworkService *networkService = [NetworkService new];
    
    __weak typeof(self)weakSelf = self;
    [networkService dailyForecastRequestWithLatitude:FakeRegion.latitude
                                        andLongitude:FakeRegion.longitude
                                      withCompletion:^(NSArray<Forecast *> *forecasts) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            Forecast *testForecast = forecasts[0];
            
            __strong typeof(self) self = weakSelf;
            self.forecastsArray = forecasts;
            [self.mainView configureWithDate:testForecast.dateString region:FakeRegion.name
                                 temperature:testForecast.temperature description:testForecast.weatherDescription
                             systemImageName:testForecast.systemImageName];
        });
    }];
}

@end
