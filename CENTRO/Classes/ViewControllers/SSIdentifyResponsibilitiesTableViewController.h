//
//  SSIdentifyResponsibilitiesTableViewController.h
//  CENTRO
//
//  Created by Silvio Salierno.
//  Copyright (c) 2013 Silvio Salierno. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SSIdentifyResponsibilitiesTableViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *nextButton;

-(IBAction)dismissVC;

@end