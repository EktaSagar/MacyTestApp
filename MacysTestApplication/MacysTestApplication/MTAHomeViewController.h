//
//  MTAViewController.h
//  MacysTestApplication
//
//  Created by Ekta Sagar on 06/02/14.
//  Copyright (c) 2014 cts. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MTAHomeViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

/**
 Action method for scan button.
 */
- (IBAction)scanEnteredId:(UIButton *)sender;
@end


#pragma mark - Uicollectionview CustomCell Declaration

/**
 Custom UICollectionViewCell class.
 */
@interface MTACollectionViewCustomCell : UICollectionViewCell

@property (nonatomic, strong) IBOutlet UIButton *buttonSubview;

@end