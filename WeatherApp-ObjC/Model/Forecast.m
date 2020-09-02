//
//	Forecast.m
// 	WeatherApp-ObjC
//

#import "Forecast.h"

@interface Forecast ()
{
    NSDate *_date;
    NSString *_weatherType;
}
@end


@implementation Forecast

- (id) initWithTimestamp :(NSTimeInterval)timestamp temperature :(NSInteger)temperature
      weatherDescription :(NSString *)weatherDescription weatherType :(NSString *)weatherType
{
    self = [super init];
    if (self)
    {
        _date = [[NSDate alloc] initWithTimeIntervalSince1970:timestamp];
        _weatherType = weatherType;
        _temperature = temperature;
        _weatherDescription = weatherDescription;
    }
    return self;
}

- (id) initFromJSONDictionary :(NSDictionary *)json
{
    NSTimeInterval timestamp = [json[@"dt"] integerValue];
    
    id temperatureDict = json[@"temp"];
    NSInteger temperature = [temperatureDict[@"day"] integerValue];
    
    NSArray *weatherDictArray = json[@"weather"];
    id weatherDict = weatherDictArray[0];
    NSString *description = weatherDict[@"description"];
    NSString *weatherType = weatherDict[@"main"];
        
    return [self initWithTimestamp:timestamp temperature:temperature weatherDescription:description weatherType:weatherType];
}

- (NSString *)dateString
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"MMMM, d";
    return [dateFormatter stringFromDate:_date];
}

- (NSString *)systemImageName
{
    if ([_weatherType isEqualToString:@"Thunderstorm"])
    {
        return @"cloud.bolt.rain";
    } else if ([_weatherType isEqualToString:@"Drizzle"])
    {
        return @"cloud.drizzle";
    } else if ([_weatherType isEqualToString:@"Rain"])
    {
        return @"cloud.rain";
    } else if ([_weatherType isEqualToString:@"Snow"])
    {
        return @"cloud.snow";
    } else if ([_weatherType isEqualToString:@"Atmosphere"])
    {
        return @"cloud.fog";
    } else if ([_weatherType isEqualToString:@"Clear"])
    {
        return @"sun.max";
    } else if ([_weatherType isEqualToString:@"Clouds"])
    {
        return @"cloud";
    } else
    {
        return nil;
    }
}

@end
