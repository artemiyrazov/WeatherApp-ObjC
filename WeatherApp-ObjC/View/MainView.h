//
//	MainView.h
// 	WeatherApp-ObjC
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MainView : UIView
@property (weak, nonatomic) IBOutlet UILabel *regionLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *temperatureLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UIImageView *weatherImageView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic) id<UITableViewDelegate> tableViewDelegate;
@property (nonatomic) id<UITableViewDataSource> tableViewDataSource;

-(void) showForecastWithDate :(NSString *)date region :(NSString *)region temperature :(NSInteger)temperature
              description :(NSString *)description systemImageName:(NSString *)systemImageName;

@end

NS_ASSUME_NONNULL_END

