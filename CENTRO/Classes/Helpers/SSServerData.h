//
//  SSServerData.h
//  CENTRO
//
//  Created by Silvio Salierno.
//  Copyright (c) 2013 Silvio Salierno. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SSServerData : NSObject

-(void) pullAndShowHUDInViewController: (UIViewController *) viewController;
-(void) pushAndShowHUDinViewController: (UIViewController *) viewController logOutAfter:(BOOL) logOut;

@end