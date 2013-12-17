//
//  SSAppDelegate.h
//  CENTRO
//
//  Created by Silvio Salierno.
//  Copyright (c) 2013 Silvio Salierno. All rights reserved.
//

#import "AFHTTPClient.h"
#import "AFJSONRequestOperation.h"
#import "AFNetworkActivityIndicatorManager.h"

@interface CENTROAPIClient : AFHTTPClient

+ (CENTROAPIClient *)sharedClient;
- (BOOL) networkIsReachable;

@end