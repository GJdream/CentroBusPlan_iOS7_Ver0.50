//
//  Category.h
//  CENTRO
//
//  Created by Centro Community Partners on 10/24/13.
//  Copyright (c) 2013 Centro Community Partners. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Company;

@interface Category : NSManagedObject

@property (nonatomic, retain) NSNumber * categoryID;
@property (nonatomic, retain) NSNumber * companyID;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * selectedAsCategory;
@property (nonatomic, retain) Company *company;

@end
