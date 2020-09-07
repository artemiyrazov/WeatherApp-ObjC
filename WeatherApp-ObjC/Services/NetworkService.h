//
//	NetworkService.h
// 	WeatherApp-ObjC
//

#import <UIKit/UIkit.h>
@class Forecast;

NS_ASSUME_NONNULL_BEGIN

@interface NetworkService : NSObject

-(void) dailyForecastRequestWithLatitude :(CGFloat)latitude
                            andLongitude :(CGFloat)longitude
                           withCompletion:(void (^)(NSArray<Forecast *> *, NSError *))completion;

@end

NS_ASSUME_NONNULL_END
