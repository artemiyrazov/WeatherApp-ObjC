//
//	ViewController.h
// 	WeatherApp-ObjC
//

#import <UIKit/UIKit.h>
@class MainView;
@class Forecast;

@interface ViewController : UIViewController

@property (nonatomic, weak) MainView *mainView;
@property (nonatomic) NSArray<Forecast *> *forecastsArray;

@end

