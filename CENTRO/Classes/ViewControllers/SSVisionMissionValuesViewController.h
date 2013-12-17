//
//  SSVisionMissionValuesViewController.h
//  CENTRO
//
//  Created by Silvio Salierno.
//  Copyright (c) 2013 Silvio Salierno. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SSVisionMissionValuesViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextView *visionTextView;
@property (weak, nonatomic) IBOutlet UITextView *missionTextView;
@property (weak, nonatomic) IBOutlet UITextView *valuesTextView;

-(void)dismissVC;

@end