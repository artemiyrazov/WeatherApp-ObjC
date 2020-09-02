//
//	TableViewCell.h
// 	WeatherApp-ObjC
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TableViewCell : UITableViewCell

@property (class, readonly) NSString *CellReuseID;

- (void) configureWithDate :(NSString *)date systemImageName :(NSString *)systemImageName
               temperature :(NSInteger)temperature;

@end

NS_ASSUME_NONNULL_END
