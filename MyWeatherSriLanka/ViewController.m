//
//  ViewController.m
//  MyWeatherSriLanka
//
//  Created by ME-Tech MacPro User 2 on 11/19/15.
//  Copyright © 2015 iTrain Asia. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"
@interface ViewController ()
@property (nonatomic, strong) NSArray *weatherArray;

@end

@implementation ViewController{
    CLLocationManager *locationManager;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    [locationManager requestAlwaysAuthorization];
    
    [locationManager startUpdatingLocation];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text = self.weatherArray[indexPath.row][@"weather"][0][@"main"];
    cell.detailTextLabel.text = self.weatherArray[indexPath.row][@"weather"][0][@"description"];
    NSString *urlString = [NSString stringWithFormat:@"http://openweathermap.org/img/w/%@.png", self.weatherArray[indexPath.row][@"weather"][0][@"icon"] ];
    NSURL *url = [NSURL URLWithString:urlString];
    
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    NSError *error;

    cell.imageView.image = [UIImage imageWithData:data];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.weatherArray count];
}


-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    
    CLLocation *currentLocation = [locations firstObject];
    [locationManager stopUpdatingLocation];
    
    if (currentLocation != nil){
        NSLog(@"%.8f %.8f", currentLocation.coordinate.latitude, currentLocation.coordinate.longitude );
        NSString *urlString = [NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/forecast?lat=%.8f&lon=%.8f&appid=2de143494c0b295cca9337e1e96b00e0",currentLocation.coordinate.latitude, currentLocation.coordinate.longitude ];
        NSURL *url = [NSURL URLWithString:urlString];
        
        
        NSData *data = [NSData dataWithContentsOfURL:url];
        
        NSError *error;
        
        NSDictionary *jsonValue = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        NSLog(@"%@",jsonValue);
        self.weatherArray = jsonValue[@"list"];
        self.locationLbl.text = [NSString stringWithFormat:@"%@, %@", jsonValue[@"city"][@"name"], jsonValue[@"city"][@"country"]];
        [self.tableView reloadData];
    }
    
    
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    
    NSLog(@"Failed");
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"detailsegue"]){
        DetailViewController *detailVC = segue.destinationViewController;
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        detailVC.weatherInfo = self.weatherArray[indexPath.row];
    }
}
@end
