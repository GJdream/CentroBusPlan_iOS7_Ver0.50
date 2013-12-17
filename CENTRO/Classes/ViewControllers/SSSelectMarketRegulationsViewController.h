//
//  SSSelectMarketRegulationsViewController.h
//  CENTRO
//
//  Created by Silvio Salierno.
//  Copyright (c) 2013 Silvio Salierno. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SSSelectMarketRegulationsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;

@property (weak, nonatomic) IBOutlet UIButton *lotRegulationsButton;
@property (weak, nonatomic) IBOutlet UIButton *someRegulationsButton;
@property (weak, nonatomic) IBOutlet UIButton *hardlyAnyRegulationsButton;
@property (weak, nonatomic) IBOutlet UIButton *noRegulationsButton;

@end