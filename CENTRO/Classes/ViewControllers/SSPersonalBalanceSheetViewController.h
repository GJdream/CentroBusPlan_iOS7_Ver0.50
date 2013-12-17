//
//  SSPersonalBalanceSheetViewController.h
//  CENTRO
//
//  Created by Silvio Salierno.
//  Copyright (c) 2013 Silvio Salierno. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SSPersonalBalanceSheetViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UILabel *personalSheetLabel;
@property (weak, nonatomic) IBOutlet UITextView *assetsTextView;
@property (weak, nonatomic) IBOutlet UITextView *liabilitiesTextView;
@property (weak, nonatomic) IBOutlet UITextView *netWorthTextView;

@end