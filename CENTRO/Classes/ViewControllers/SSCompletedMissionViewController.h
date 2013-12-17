//
//  SSCompletedMissionViewController.h
//  CENTRO
//
//  Created by Silvio Salierno.
//  Copyright (c) 2013 Silvio Salierno. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SSCompletedMissionViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIBarButtonItem *tryAgainButton;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UILabel *missionLabel;
@property (weak, nonatomic) IBOutlet UITextView *missionTextView;

@end