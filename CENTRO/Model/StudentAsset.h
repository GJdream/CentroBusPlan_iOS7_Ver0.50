//
//  StudentAsset.h
//  CENTRO
//
//  Created by Marcio R. Arantes on 10/24/13.
//  Copyright (c) 2013 Silvio Salierno. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Student;

@interface StudentAsset : NSManagedObject

@property (nonatomic, retain) NSNumber * amount;
@property (nonatomic, retain) NSNumber * isSure;
@property (nonatomic, retain) NSNumber * selectedAsAsset;
@property (nonatomic, retain) NSString * studentAssetCode;
@property (nonatomic, retain) NSNumber * studentAssetID;
@property (nonatomic, retain) NSString * studentAssetLiteralUS;
@property (nonatomic, retain) NSNumber * studentID;
@property (nonatomic, retain) Student *student;

@end
