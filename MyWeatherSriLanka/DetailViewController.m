//
//  DetailViewController.m
//  MyWeatherSriLanka
//
//  Created by ME-Tech MacPro User 2 on 11/20/15.
//  Copyright © 2015 iTrain Asia. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mainLbl.text = self.weatherInfo[@"weather"][0][@"main"];
    self.descLbl.text = self.weatherInfo[@"weather"][0][@"description"];
    self.tempLbl.text = [NSString stringWithFormat:@"%@ K",self.weatherInfo[@"main"][@"temp"]];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
