//
//  SSAddEditBusinessCostViewController.h
//  CENTRO
//
//  Created by Silvio Salierno.
//  Copyright (c) 2013 Silvio Salierno. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CompanyCost.h"

@interface SSAddEditBusinessCostViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UILabel *editItemLabel;
@property (weak, nonatomic) IBOutlet UITextField *editAmountTextField;
@property (weak, nonatomic) IBOutlet UILabel *editFrequencyLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *editFrequencySegmentedControl;
@property (weak, nonatomic) IBOutlet UIButton *editIsSureButton;

@property BOOL editingExistingCost;
@property (strong, nonatomic) CompanyCost *companyCost;

@end