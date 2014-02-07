//
//  MTADetailViewController.m
//  MacysTestApplication
//
//  Created by Ekta Sagar on 06/02/14.
//  Copyright (c) 2014 cts. All rights reserved.
//

#import "MTADetailViewController.h"

@interface MTADetailViewController ()

@end

@implementation MTADetailViewController
@synthesize tapCounter;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.tapCounter=0;
    }
    return self;
}
/**
 Returns a singleton object of MTADetailViewController class.
 */
+ (instancetype)sharedInstance  {
    
    static MTADetailViewController *sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedInstance = [[MTADetailViewController alloc] initWithNibName:@"MTADetailViewController" bundle:[NSBundle mainBundle]];
    });
    return sharedInstance;
}
#pragma mark - View Lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillAppear:(BOOL)animated
{
    //increment tapCounter
    self.tapCounter+=1;
    
    //Display tap counter on the label.
    [self.labelTapCount setText:[NSString stringWithFormat:@"Tap # %d",self.tapCounter]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark IBAction methods

- (IBAction)dismissView:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
