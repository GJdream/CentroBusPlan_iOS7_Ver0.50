//
//  SSEmployeeCompetencyPerActivityViewController.h
//  CENTRO
//
//  Created by Centro Community Partners.
//  Copyright (c) 2013 Centro Community Partners. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SSEmployeeCompetencyPerActivityViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UILabel *activityLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *frequencySegmentedControl;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property (weak, nonatomic) IBOutlet UIButton *backButton;

@end