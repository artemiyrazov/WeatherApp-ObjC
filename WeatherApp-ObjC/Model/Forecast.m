//
//	Forecast.m
// 	WeatherApp-ObjC
//

#import "Forecast.h"

@implementation Forecast

- (id) initWithTimestamp :(NSTimeInterval)timestamp temperature :(CGFloat)temperature
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
