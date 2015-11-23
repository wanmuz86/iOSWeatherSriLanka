//
//  ViewController.h
//  MyWeatherSriLanka
//
//  Created by ME-Tech MacPro User 2 on 11/19/15.
//  Copyright © 2015 iTrain Asia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *locationLbl;

@end

