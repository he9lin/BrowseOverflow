//
//  NonNetworkedStackOverflowCommunicator.m
//  BrowseOverflow
//
//  Created by Lin He on 7/10/12.
//  Copyright (c) 2012 Heyook. All rights reserved.
//

#import "NonNetworkedStackOverflowCommunicator.h"

@implementation NonNetworkedStackOverflowCommunicator

- (void)launchConnectionForRequest: (NSURLRequest *)request {
    
}

- (void)setReceivedData:(NSData *)data {
    receivedData = [data mutableCopy];
}

- (NSData *)receivedData {
    return [receivedData copy];
}

@end
