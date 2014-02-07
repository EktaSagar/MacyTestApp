//
//  MTAViewController.m
//  MacysTestApplication
//
//  Created by Ekta Sagar on 06/02/14.
//  Copyright (c) 2014 cts. All rights reserved.
//

#import "MTAHomeViewController.h"
#import "MTADetailViewController.h"

@interface MTAHomeViewController ()
@property (nonatomic)NSArray* arrayButtonImages;
@end

@implementation MTAHomeViewController

@synthesize arrayButtonImages;
#pragma mark - View Lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    arrayButtonImages = @[@"SampleOfferImage1.png",
                          @"ImageHomePageTile1.png",
                          @"ImageHomePageTile2.png",
                          @"ImageHomePageTile3.png",
                          @"ImageHomePageTile4.png",
                          @"ImageHomePageTile5.png",
                          @"ImageHomePageTile6.png",
                          @"SampleOfferImage2.png",
                          @"SampleOfferImage3.png"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark UIcollectionview datasource methods

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView  numberOfItemsInSection:(NSInteger)section
{
    //set number of items equal to number of cells to be populated.
    return [arrayButtonImages count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MTACollectionViewCustomCell *customCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionViewCell" forIndexPath:indexPath];
    
    //set image for button in collectionviewcell
    [customCell.buttonSubview setImage:[UIImage imageNamed:[arrayButtonImages objectAtIndex:indexPath.row]] forState:UIControlStateNormal];
    [customCell.buttonSubview addTarget:self action:@selector(openDetailView) forControlEvents:UIControlEventTouchUpInside];
    
    return customCell;
}

#pragma mark UICollectionViewFlowLayoutDelegate
/**
 Returns custom cell size equivalent to image size.
 */
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UIImage *buttonImage = [UIImage imageNamed:[arrayButtonImages objectAtIndex:indexPath.row]];
    CGSize size=CGSizeMake(buttonImage.size.width, buttonImage.size.height);
    return size;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
   return UIEdgeInsetsMake(5.0f,5.0f,5.0f,5.0f);
}

#pragma mark UISearchbar delegate methods
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self dismissKeyboard];
    
    UIAlertView *alertViewScanResult=[[UIAlertView alloc] initWithTitle:@"Scan Result" message:@"No records found." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [alertViewScanResult show];
    alertViewScanResult=nil;
}

#pragma mark Action methods
/**
 Action method to navigate to next view i.e. detail view.
 */
-(void)openDetailView
{
    [self dismissKeyboard];
    
    MTADetailViewController *detailViewControllerInstance = [MTADetailViewController sharedInstance];
    [self.navigationController pushViewController:detailViewControllerInstance animated:YES];
}

- (IBAction)scanEnteredId:(UIButton *)sender {
    [self dismissKeyboard];
    
    UIAlertView *alertViewScanResult=[[UIAlertView alloc] initWithTitle:@"Scan Result" message:@"No data to scan." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [alertViewScanResult show];
    alertViewScanResult=nil;
}

/**
 Method to dismiss keyboard if present
 */
-(void)dismissKeyboard{
    if ([self.searchBar isFirstResponder]) {
        [self.searchBar resignFirstResponder];
    }
}
@end

@implementation MTACollectionViewCustomCell

@end