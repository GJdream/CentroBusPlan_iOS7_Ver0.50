//
//  SSCompletedCompetitorRankCell.h
//  CENTRO
//
//  Created by Silvio Salierno.
//  Copyright (c) 2013 Silvio Salierno. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SSCompletedCompetitorRankCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *competitorLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceRankLabel;
@property (weak, nonatomic) IBOutlet UILabel *customerServiceRankLabel;
@property (weak, nonatomic) IBOutlet UILabel *qualityRankLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationRankLabel;
@property (weak, nonatomic) IBOutlet UILabel *speedRankLabel;

@end