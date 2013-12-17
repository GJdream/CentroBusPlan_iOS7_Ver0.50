//
//  SSUser.h
//  CENTRO
//
//  Created by Silvio Salierno.
//  Copyright (c) 2013 Silvio Salierno. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SSUser : NSObject

@property (strong, nonatomic) NSString *segueToPerform;


+ (SSUser *)currentUser;
- (BOOL) isLoggedIn;
- (void) logOutAndPresentHUDInViewController:(UIViewController *) hudViewController;
- (NSString *) username;
- (void) registerUser:(NSString *) username withAuthToken:(NSString *) authToken ID:(NSString *) studentID andCompanyID:(NSString *) companyID;
- (NSString *) token;
- (NSString *) studentID;
- (NSString *) companyID;
- (void) setActivityNumberAsCompleted: (NSString *) activityNumber andSyncStatus: (BOOL) synced;
- (void) setActivityNumberAsIncompleted:(NSString *) activityNumber;
- (NSArray *) listOfNotSyncedActivities;
- (void) localLogOut;

@end