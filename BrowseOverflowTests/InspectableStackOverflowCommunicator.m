//
//  InspectableStackOverflowCommunicator.m
//  BrowseOverflow
//
//  Created by Lin He on 7/10/12.
//  Copyright (c) 2012 Heyook. All rights reserved.
//

#import "InspectableStackOverflowCommunicator.h"

@implementation InspectableStackOverflowCommunicator

- (NSURL *)URLToFetch {
    return fetchingURL;
}

- (NSURLConnection *)currentURLConnection {
    return fetchingConnection;
}

@end
