//
//  SSPersonalIncomeStatementViewController.h
//  CENTRO
//
//  Created by Silvio Salierno.
//  Copyright (c) 2013 Silvio Salierno. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SSPersonalIncomeStatementViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UILabel *personalStatementLabel;
@property (weak, nonatomic) IBOutlet UITextView *totalIncomeTextView;
@property (weak, nonatomic) IBOutlet UITextView *totalExpensesTextView;
@property (weak, nonatomic) IBOutlet UITextView *netIncomeTextView;

@end