//
//	MainView.m
// 	WeatherApp-ObjC
//

#import "MainView.h"

@implementation MainView

- (void)setTableViewDelegate:(id<UITableViewDelegate>)tableViewDelegate
{
    self.tableView.delegate = tableViewDelegate;
}

- (void)setTableViewDataSource:(id<UITableViewDataSource>)tableViewDataSource
{
    self.tableView.dataSource = tableViewDataSource;
}

- (void)showForecastWithDate:(NSString *)date region:(NSString *)region temperature:(NSInteger)temperature
              description:(NSString *)description systemImageName:(NSString *)systemImageName
{
    self.dateLabel.text = date;
    self.descriptionLabel.text = description;
    self.regionLabel.text = region;
    self.temperatureLabel.text = [[@(temperature) stringValue] stringByAppendingFormat:@"ºC"];
    if (@available(iOS 13.0, *)) {
        self.weatherImageView.image = [UIImage systemImageNamed:systemImageName];
    }
    
    [self.tableView reloadData];
}


@end
