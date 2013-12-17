//
//  Mission.h
//  CENTRO
//
//  Created by Marcio R. Arantes on 10/24/13.
//  Copyright (c) 2013 Silvio Salierno. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Company;

@interface Mission : NSManagedObject

@property (nonatomic, retain) NSNumber * companyID;
@property (nonatomic, retain) NSString * mission;
@property (nonatomic, retain) NSNumber * missionID;
@property (nonatomic, retain) Company *company;

@end
