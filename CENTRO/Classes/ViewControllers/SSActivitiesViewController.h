//
//  SSActivitiesViewController.h
//  CENTRO
//
//  Created by Silvio Salierno.
//  Copyright (c) 2013 Silvio Salierno. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SSActivitiesViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UIBarButtonItem *syncButton;

-(IBAction)loadProfile;

@end