//
//  SSCompanySellViewController.h
//  CENTRO
//
//  Created by Silvio Salierno.
//  Copyright (c) 2013 Silvio Salierno. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SSCompanySellViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UIButton *onlyProductsButton;
@property (weak, nonatomic) IBOutlet UIButton *equalProductsServicesButton;
@property (weak, nonatomic) IBOutlet UIButton *onlyServicesButton;


-(IBAction)dismissVC;


@end