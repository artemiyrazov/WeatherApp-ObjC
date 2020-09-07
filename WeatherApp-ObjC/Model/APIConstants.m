//
//	APIConstants.m
// 	WeatherApp-ObjC
//

#import "APIConstants.h"

NSString *const OpenWeatherAPIKey = @"13dc246a7290f4b3221209cd010dd554";
NSString *const OpenWeatherAPIGetWeatherURL = @"https://api.openweathermap.org/data/2.5/onecall";

NSString *const TemperatureUnitsCelsius = @"metric";
NSString *const TemperatureUnitsFahrenheit = @"imperial";

NSString *const ForecastReportTypeCurrent = @"current";
NSString *const ForecastReportTypeMinutely = @"minutely";
NSString *const ForecastReportTypeHourly = @"hourly";
NSString *const ForecastReportTypeDaily = @"daily";

NSString *const FakeRegionName = @"Saint-Petersburg";
CGFloat const FakeRegionLatitude = 59.939095;
CGFloat const FakeRegionLongitude = 30.315868;
