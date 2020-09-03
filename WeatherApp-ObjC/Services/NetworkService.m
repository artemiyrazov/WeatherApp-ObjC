//
//	NetworkService.m
// 	WeatherApp-ObjC
//

#import "NetworkService.h"
#import "APIConstants.h"
#import "Forecast.h"

@implementation NetworkService

- (void)dailyForecastRequestWithLatitude:(CGFloat)latitude andLongitude:(CGFloat)longitude
                          withCompletion: (void (^)(NSArray<Forecast *> *))completion
{
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString:OpenWeatherAPIGetWeatherURL];
    
 
    NSString *excludedReports = [NSString stringWithFormat:@"%@ %@ %@ %@ %@",
                                 ForecastReportTypeCurrent, @",",
                                 ForecastReportTypeHourly, @",",
                                 ForecastReportTypeMinutely];
    
    NSArray *queryItems = @[[[NSURLQueryItem alloc] initWithName:@"lat" value:[@(latitude) stringValue]],
                            [[NSURLQueryItem alloc] initWithName:@"lon" value:[@(longitude) stringValue]],
                            [[NSURLQueryItem alloc] initWithName:@"appid" value:OpenWeatherAPIKey],
                            [[NSURLQueryItem alloc] initWithName:@"units" value:TemperatureUnitsCelsius],
                            [[NSURLQueryItem alloc] initWithName:@"exclude" value:excludedReports]];
    
    urlComponents.queryItems = queryItems;
    NSURL *url = urlComponents.URL;
    
    NSURLSessionDataTask *dataTask = [NSURLSession.sharedSession
                                      dataTaskWithURL:url
                                      completionHandler:^(NSData *data,
                                                          NSURLResponse *response,
                                                          NSError *error) {
        
        if (error == nil && data.bytes != 0) {
            
            NSError *jsonError = nil;
            id json = [NSJSONSerialization JSONObjectWithData:data
                                                      options:0
                                                        error:&jsonError];
            if (jsonError) {
                NSLog(@"%@", jsonError.localizedDescription);
                return;
            }
                        
            NSMutableArray<Forecast *> *forecastsArray = [NSMutableArray new];
            
            for (NSDictionary *forecastDict in json[@"daily"]) {
                [forecastsArray addObject: [[Forecast alloc] initFromJSONDictionary:forecastDict]];
            }
            
            completion(forecastsArray);
        }
    }];
    
    [dataTask resume];
}
@end
