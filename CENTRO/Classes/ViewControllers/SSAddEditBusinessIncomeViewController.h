//
//  SSAddEditBusinessIncomeViewController.h
//  CENTRO
//
//  Created by Silvio Salierno.
//  Copyright (c) 2013 Silvio Salierno. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"

@interface SSAddEditBusinessIncomeViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UILabel *editItemLabel;
@property (weak, nonatomic) IBOutlet UITextField *editAmountTextField;
@property (weak, nonatomic) IBOutlet UILabel *editFrequencyLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *editFrequencySegmentedControl;
@property (weak, nonatomic) IBOutlet UIButton *editIsSureButton;

@property BOOL editingExistingIncome;
@property (strong, nonatomic) Product *item;

@end