//
//  SSAddEditPersonalDebtsViewController.h
//  CENTRO
//
//  Created by Silvio Salierno.
//  Copyright (c) 2013 Silvio Salierno. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StudentDebt.h"

@interface SSAddEditPersonalDebtsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UILabel *editItemLabel;
@property (weak, nonatomic) IBOutlet UITextField *editAmountTextField;
@property (weak, nonatomic) IBOutlet UILabel *editNoteLabel;
@property (weak, nonatomic) IBOutlet UIButton *editIsSureButton;

@property BOOL editingExistingDebt;
@property (strong, nonatomic) StudentDebt *studentDebt;

@end