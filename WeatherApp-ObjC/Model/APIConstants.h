//
//	APIConstants.h
// 	WeatherApp-ObjC
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface OpenWeatherAPI: NSObject
extern NSString *const OpenWeatherAPIKey;
extern NSString *const OpenWeatherAPIGetWeatherURL;
@end

@interface TemperatureUnits : NSObject
extern NSString *const TemperatureUnitsCelsius;
extern NSString *const TemperatureUnitsFahrenheit;
@end

@interface ForecastReportType : NSObject
extern NSString *const ForecastReportTypeCurrent;
extern NSString *const ForecastReportTypeMinutely;
extern NSString *const ForecastReportTypeHourly;
extern NSString *const ForecastReportTypeDaily;
@end

@interface FakeRegion : NSObject
extern NSString *const FakeRegionName;
extern CGFloat const FakeRegionLatitude;
extern CGFloat const FakeRegionLongitude;
@end

NS_ASSUME_NONNULL_END
