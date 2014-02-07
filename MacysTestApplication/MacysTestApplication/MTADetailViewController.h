//
//  MTADetailViewController.h
//  MacysTestApplication
//
//  Created by Ekta Sagar on 06/02/14.
//  Copyright (c) 2014 cts. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MTADetailViewController : UIViewController
@property (nonatomic,assign) int tapCounter;
@property (weak, nonatomic) IBOutlet UILabel *labelTapCount;

+ (instancetype)sharedInstance;
- (IBAction)dismissView:(UIButton *)sender;
@end
