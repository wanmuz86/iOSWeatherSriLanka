//
//  DetailViewController.h
//  MyWeatherSriLanka
//
//  Created by ME-Tech MacPro User 2 on 11/20/15.
//  Copyright © 2015 iTrain Asia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *mainLbl;
@property (weak, nonatomic) IBOutlet UILabel *descLbl;
@property (weak, nonatomic) IBOutlet UILabel *dateLbl;

@property (weak, nonatomic) IBOutlet UILabel *tempLbl;
@property (nonatomic, strong) NSDictionary *weatherInfo;
@end
