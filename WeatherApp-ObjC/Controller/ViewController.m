//
//	ViewController.m
// 	WeatherApp-ObjC
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mainView = ((MainView *) self.view);
    [self.mainView configureWithDate:@"today" region:@"Saint-P" temperature:15 description:@"Rainy" systemImageName:@"cloud.rain"];
}

@end
