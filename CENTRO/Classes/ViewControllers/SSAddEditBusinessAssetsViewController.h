//
//  SSAddEditBusinessAssetsViewController.h
//  CENTRO
//
//  Created by Silvio Salierno.
//  Copyright (c) 2013 Silvio Salierno. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CompanyAsset.h"

@interface SSAddEditBusinessAssetsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UILabel *editItemLabel;
@property (weak, nonatomic) IBOutlet UITextField *editAmountTextField;
@property (weak, nonatomic) IBOutlet UILabel *editNoteLabel;
@property (weak, nonatomic) IBOutlet UIButton *editIsSureButton;

@property BOOL editingExistingAsset;
@property (strong, nonatomic) CompanyAsset *companyAsset;

@end