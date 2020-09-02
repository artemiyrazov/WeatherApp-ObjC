//
//	Forecast.m
// 	WeatherApp-ObjC
//

#import "Forecast.h"

@implementation Forecast

- (id) initWithTimestamp :(NSTimeInterval)timestamp temperature :(NSInteger)temperature
      weatherDescription :(NSString *)weatherDescription weatherType :(NSString *)weatherType
{
    self = [super init];
    if (self)
    {
        self->date = [[NSDate alloc] initWithTimeIntervalSince1970:timestamp];
        self->weatherType = weatherType;
        self.temperature = temperature;
        self.weatherDescription = weatherDescription;
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
    
    Forecast *forecast = [[Forecast alloc] initWithTimestamp:timestamp
                                                 temperature:temperature
                                          weatherDescription:description
                                                 weatherType:weatherType];
    
    return forecast;
}

- (NSString *)dateString
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"MMMM, d";
    return [dateFormatter stringFromDate:date];
}

- (NSString *)systemImageName
{
    if ([weatherType isEqualToString:@"Thunderstorm"])
    {
        return @"cloud.bolt.rain";
    } else if ([weatherType isEqualToString:@"Drizzle"])
    {
        return @"cloud.drizzle";
    } else if ([weatherType isEqualToString:@"Rain"])
    {
        return @"cloud.rain";
    } else if ([weatherType isEqualToString:@"Snow"])
    {
        return @"cloud.snow";
    } else if ([weatherType isEqualToString:@"Atmosphere"])
    {
        return @"cloud.fog";
    } else if ([weatherType isEqualToString:@"Clear"])
    {
        return @"sun.max";
    } else if ([weatherType isEqualToString:@"Clouds"])
    {
        return @"cloud";
    } else
    {
        return nil;
    }
}

@end
