//
//  SSValuePropositionsRankTableViewController.h
//  CENTRO
//
//  Created by Silvio Salierno.
//  Copyright (c) 2013 Silvio Salierno. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SSCompetitiveAdvantageRankCell.h"

@interface SSValuePropositionsRankTableViewController : UITableViewController <SSCompetitiveAdvantageRankCellDelegate>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

-(IBAction)dismissVC;

@end