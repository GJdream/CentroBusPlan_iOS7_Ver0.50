//
//  SSIdentifyOperatingHoursTableViewController.h
//  CENTRO
//
//  Created by Silvio Salierno.
//  Copyright (c) 2013 Silvio Salierno. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SSIdentifyOperatingHoursTableViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UIBarButtonItem *nextButton;
@property (weak, nonatomic) IBOutlet UILabel *titleQuestionLabel;


-(IBAction)dismissVC;


@end