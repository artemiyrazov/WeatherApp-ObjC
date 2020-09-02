//
//	APIConstants.h
// 	WeatherApp-ObjC
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface OpenWeatherAPIConstants : NSObject
@property (class, readonly) NSString *APIKey;
@property (class, readonly) NSString *getWeatherURL;
@end

@interface TemperatureUnits : NSObject
@property (class, readonly) NSString *celsius;
@property (class, readonly) NSString *fahrenheit;
@end

@interface ForecastReportType : NSObject
@property (class, readonly) NSString *current;
@property (class, readonly) NSString *minutely;
@property (class, readonly) NSString *hourly;
@property (class, readonly) NSString *daily;
@end

@interface FakeRegion : NSObject
@property (class, readonly) NSString *name;
@property (class, readonly) CGFloat latitude;
@property (class, readonly) CGFloat longitude;
@end

NS_ASSUME_NONNULL_END
