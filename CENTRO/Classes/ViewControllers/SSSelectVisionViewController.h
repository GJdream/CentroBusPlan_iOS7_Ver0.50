//
//  SSSelectVisionViewController.h
//  CENTRO
//
//  Created by Silvio Salierno.
//  Copyright (c) 2013 Silvio Salierno. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SSSelectVisionViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UILabel *visionQuestionLabel;
@property (weak, nonatomic) IBOutlet UITextView *purposeATextView;
@property (weak, nonatomic) IBOutlet UITextView *purposeBTextView;
@property (weak, nonatomic) IBOutlet UITextView *purposeCTextView;

@property (weak, nonatomic) IBOutlet UIButton *purposeAButton;
@property (weak, nonatomic) IBOutlet UIButton *purposeBButton;
@property (weak, nonatomic) IBOutlet UIButton *purposeCButton;

@end