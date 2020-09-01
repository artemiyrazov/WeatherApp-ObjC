//
//	ViewController.m
// 	WeatherApp-ObjC
//

#import "ViewController.h"
#import "Forecast.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.mainView = ((MainView *) self.view);
    
    Forecast *testForecast = [[Forecast alloc] initWithTimestamp:1598969289 temperature:25.5
                                              weatherDescription:@"Rainy" weatherType:@"Clouds"];
    
    [self.mainView configureWithDate:testForecast.dateString region:@"Saint-Petersburg"
                         temperature:testForecast.temperature description:testForecast.weatherDescription
                     systemImageName:testForecast.systemImageName];
}

@end
