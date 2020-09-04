//
//	ViewController.h
// 	WeatherApp-ObjC
//

#import <UIKit/UIKit.h>
@class MainView;
@class Forecast;
@class NetworkService;

@interface ForecastViewController : UIViewController

@property (nonatomic) NetworkService *networkService;

@end

