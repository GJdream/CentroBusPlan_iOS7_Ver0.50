//
//  SSNumberOfEmployeesViewController.h
//  CENTRO
//
//  Created by Silvio Salierno.
//  Copyright (c) 2013 Silvio Salierno. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SSNumberOfEmployeesViewController : UIViewController <UIActionSheetDelegate, UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *employeeButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *nextButton;
@property (strong, nonatomic) IBOutlet UIPickerView *employeePickerView;

-(IBAction)dismissVC;


@end