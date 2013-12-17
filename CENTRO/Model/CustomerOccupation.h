//
//  CustomerOccupation.h
//  CENTRO
//
//  Created by Marcio R. Arantes on 10/24/13.
//  Copyright (c) 2013 Silvio Salierno. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CustomerProfile;

@interface CustomerOccupation : NSManagedObject

@property (nonatomic, retain) NSNumber * customerProfileID;
@property (nonatomic, retain) NSString * occupationCode;
@property (nonatomic, retain) NSNumber * occupationID;
@property (nonatomic, retain) NSString * occupationLiteralUS;
@property (nonatomic, retain) NSNumber * selectedAsCustomerOccupation;
@property (nonatomic, retain) CustomerProfile *customerProfile;

@end
