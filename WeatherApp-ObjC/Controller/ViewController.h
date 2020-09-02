//
//	ViewController.h
// 	WeatherApp-ObjC
//

#import <UIKit/UIKit.h>
@class MainView;
@class Forecast;
@class NetworkService;

@interface ViewController : UIViewController

@property (nonatomic, weak) MainView *mainView;
@property (nonatomic) NSArray<Forecast *> *forecastsArray;
@property (nonatomic) NetworkService *networkService;

- (void) refreshViews;

@end

