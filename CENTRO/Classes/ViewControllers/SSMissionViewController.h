//
//  SSMissionViewController.h
//  CENTRO
//
//  Created by Silvio Salierno.
//  Copyright (c) 2013 Silvio Salierno. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SSMissionViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *missionLabel;
@property (weak, nonatomic) IBOutlet UITextView *visionTextView;
@property (weak, nonatomic) IBOutlet UITextView *missionTextView;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;


-(IBAction)dismissVC;
@end