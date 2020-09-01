//
//	Forecast.h
// 	WeatherApp-ObjC
//

#import <UIKit/UIKit.h>

//typedef enum {
//    Thunderstorm, Drizzle, Rain, Snow, Atmosphere, Clear, Clouds
//} WeatherType;

NS_ASSUME_NONNULL_BEGIN

@interface Forecast : NSObject
{
    NSDate *date;
    NSString *weatherType;
}

@property (nonatomic, readonly, nullable) NSString *systemImageName;
@property (nonatomic, readonly) NSString *dateString;

@property (nonatomic) NSString *weatherDescription;
@property (nonatomic) CGFloat temperature;

-(id) initWithTimestamp :(NSTimeInterval)timestamp temperature :(CGFloat)temperature
     weatherDescription :(NSString *)weatherDescription weatherType :(NSString *)weatherType;

@end

NS_ASSUME_NONNULL_END
