//
//	Forecast.h
// 	WeatherApp-ObjC
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Forecast : NSObject

@property (nonatomic, readonly, nullable) NSString *systemImageName;
@property (nonatomic, readonly) NSString *dateString;
@property (nonatomic) NSString *weatherDescription;
@property (nonatomic) NSInteger temperature;

-(id) initWithTimestamp :(NSTimeInterval)timestamp temperature :(NSInteger)temperature
     weatherDescription :(NSString *)weatherDescription weatherType :(NSString *)weatherType;
-(id) initFromJSONDictionary :(NSDictionary *)json;

@end

NS_ASSUME_NONNULL_END
