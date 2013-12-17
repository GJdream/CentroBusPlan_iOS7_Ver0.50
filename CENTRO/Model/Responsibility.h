//
//  Responsibility.h
//  CENTRO
//
//  Created by Marcio R. Arantes on 10/24/13.
//  Copyright (c) 2013 Silvio Salierno. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Company;

@interface Responsibility : NSManagedObject

@property (nonatomic, retain) NSNumber * companyID;
@property (nonatomic, retain) NSString * responsibilityDescription;
@property (nonatomic, retain) NSNumber * responsibilityID;
@property (nonatomic, retain) NSNumber * selectedAsResponsibility;
@property (nonatomic, retain) Company *company;

@end
