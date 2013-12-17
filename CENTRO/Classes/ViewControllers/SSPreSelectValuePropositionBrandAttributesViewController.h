//
//  SSPreSelectValuePropositionBrandAttributesViewController.h
//  CENTRO
//
//  Created by Silvio Salierno.
//  Copyright (c) 2013 Silvio Salierno. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SSPreSelectValuePropositionBrandAttributesViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;

@property (weak, nonatomic) IBOutlet UITextView *valuePropositionTextView;
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UILabel *attributeLabel;
@property (weak, nonatomic) IBOutlet UIButton *notAtAllButton;
@property (weak, nonatomic) IBOutlet UIButton *aLittleButton;
@property (weak, nonatomic) IBOutlet UIButton *veryMuchButton;

@end