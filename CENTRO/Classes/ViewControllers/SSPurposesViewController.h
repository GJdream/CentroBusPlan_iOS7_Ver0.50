//
//  SSPurposesViewController.h
//  CENTRO
//
//  Created by Silvio Salierno.
//  Copyright (c) 2013 Silvio Salierno. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SSPurposesViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UILabel *purposeQuestionLabel;
@property (weak, nonatomic) IBOutlet UITextView *purposeAnswerTextView;

-(IBAction)dismissVC;

@end