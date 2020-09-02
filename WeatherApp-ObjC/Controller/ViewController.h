//
//	ViewController.h
// 	WeatherApp-ObjC
//

#import <UIKit/UIKit.h>
@class MainView;
@class Forecast;
@class NetworkService;

@interface ViewController : UIViewController

@property (nonatomic) NetworkService *networkService;

@end

