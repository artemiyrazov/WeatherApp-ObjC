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
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString:OpenWeatherAPIConstants.getWeatherURL];
    
 
    NSString *excludedReports = [NSString stringWithFormat:@"%@ %@ %@ %@ %@",
                     ForecastReportType.current, @",",
                     ForecastReportType.hourly, @",",
                     ForecastReportType.minutely];
    
    NSArray *queryItems = [[NSArray alloc] initWithObjects:
                           [[NSURLQueryItem alloc] initWithName:@"lat" value:[@(latitude) stringValue]],
                           [[NSURLQueryItem alloc] initWithName:@"lon" value:[@(longitude) stringValue]],
                           [[NSURLQueryItem alloc] initWithName:@"appid" value:OpenWeatherAPIConstants.APIKey],
                           [[NSURLQueryItem alloc] initWithName:@"units" value:TemperatureUnits.celsius],
                           [[NSURLQueryItem alloc] initWithName:@"exclude" value:excludedReports], nil];
    
    urlComponents.queryItems = queryItems;
    NSURL *url = urlComponents.URL;
    
    NSURLSessionDataTask *dataTask = [NSURLSession.sharedSession
                                      dataTaskWithURL:url
                                      completionHandler:^(NSData *data,
                                                          NSURLResponse *response,
                                                          NSError *error) {
        
        if (error == nil && data.bytes != 0) {
            Forecast *testForecast = [[Forecast alloc] initWithTimestamp:1598969289 temperature:25.5
                                                      weatherDescription:@"Rainy" weatherType:@"Clouds"];
            NSArray *arr = @[testForecast];
            completion(arr);
        }
    }];
    
    [dataTask resume];
}
@end
