//
//  SSUtils.h
//  CENTRO
//
//  Created by Silvio Salierno.
//  Copyright (c) 2013 Silvio Salierno. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SSUtils : NSObject

+ (NSMutableAttributedString *) attributtedStringForHeaderInTableView: (NSString *) text;

+ (NSMutableAttributedString *) attributtedStringForCellTextOnlyTitle: (NSString *) text;

+ (NSMutableAttributedString *) attributtedStringForTitleCellTextGreen: (NSString *) text;

+ (NSMutableAttributedString *) attributtedStringForSubTitleCellTextGray: (NSString *) text;


+ (NSMutableAttributedString *) attributtedStringForTitleCellTextGray: (NSString *) text;

+ (NSMutableAttributedString *) attributtedStringForDetailCellTextGray: (NSString *) text;

+ (void) showAlertViewBasedOnNetworkError: (NSError *) error;

+ (void) setTableViewBackground:(UITableView *) tableView;

+ (NSString *) companyName;

@end