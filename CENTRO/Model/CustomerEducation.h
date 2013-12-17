//
//  CustomerEducation.h
//  CENTRO
//
//  Created by Marcio R. Arantes on 10/24/13.
//  Copyright (c) 2013 Silvio Salierno. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CustomerProfile;

@interface CustomerEducation : NSManagedObject

@property (nonatomic, retain) NSNumber * customerProfileID;
@property (nonatomic, retain) NSString * educationCode;
@property (nonatomic, retain) NSNumber * educationID;
@property (nonatomic, retain) NSString * educationLiteralUS;
@property (nonatomic, retain) NSNumber * selectedAsCustomerEducation;
@property (nonatomic, retain) CustomerProfile *customerProfile;

@end
