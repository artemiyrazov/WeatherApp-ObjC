//
//	TableViewCell.m
// 	WeatherApp-ObjC
//

#import "TableViewCell.h"

@implementation TableViewCell

+ (NSString *)CellReuseID
{
    return @"Cell";
}

- (void)configureWithDate:(NSString *)date systemImageName:(NSString *)systemImageName
              temperature:(NSInteger)temperature
{
    self.dateLabel.text = date;
    self.temperatureLabel.text = [[@(temperature) stringValue] stringByAppendingFormat:@"ºC"];
    
    if (@available(iOS 13.0, *)) {
        self.weatherImageView.image = [UIImage systemImageNamed:systemImageName];
    }
}

@end
