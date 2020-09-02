//
//	APIConstants.m
// 	WeatherApp-ObjC
//

#import "APIConstants.h"

@implementation OpenWeatherAPIConstants
+ (NSString *)APIKey
{
    return @"13dc246a7290f4b3221209cd010dd554";
}
+ (NSString *)getWeatherURL
{
    return @"https://api.openweathermap.org/data/2.5/onecall";
}
@end

@implementation TemperatureUnits
+ (NSString *)celsius
{
    return @"metric";
}
+ (NSString *)fahrenheit
{
    return @"imperial";
}
@end

@implementation ForecastReportType
+ (NSString *)current
{
    return @"current";
}
+ (NSString *)minutely
{
    return @"minutely";
}
+ (NSString *)hourly
{
    return @"hourly";
}
+ (NSString *)daily
{
    return @"daily";
}
@end

@implementation FakeRegion
+ (NSString *)name
{
    return @"Saint-Petersburg";
}
+ (CGFloat)latitude
{
    return 59.939095;
}
+ (CGFloat)longitude
{
    return 30.315868;
}
@end
