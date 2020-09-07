//
//	MainView.h
// 	WeatherApp-ObjC
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MainView : UIView

@property (nonatomic) id<UITableViewDelegate> tableViewDelegate;
@property (nonatomic) id<UITableViewDataSource> tableViewDataSource;

-(void) showForecastWithDate :(NSString *)date region :(NSString *)region temperature :(NSInteger)temperature
                 description :(NSString *)description systemImageName:(NSString *)systemImageName;

@end

NS_ASSUME_NONNULL_END

