//
//  SSAddEditPersonalAssetsViewController.h
//  CENTRO
//
//  Created by Silvio Salierno.
//  Copyright (c) 2013 Silvio Salierno. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StudentAsset.h"

@interface SSAddEditPersonalAssetsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UILabel *editItemLabel;
@property (weak, nonatomic) IBOutlet UITextField *editAmountTextField;
@property (weak, nonatomic) IBOutlet UILabel *editNoteLabel;
@property (weak, nonatomic) IBOutlet UIButton *editIsSureButton;

@property BOOL editingExistingAsset;
@property (strong, nonatomic) StudentAsset *studentAsset;

@end