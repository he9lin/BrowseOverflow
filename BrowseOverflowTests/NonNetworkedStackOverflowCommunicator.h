//
//  NonNetworkedStackOverflowCommunicator.h
//  BrowseOverflow
//
//  Created by Lin He on 7/10/12.
//  Copyright (c) 2012 Heyook. All rights reserved.
//

#import "StackOverflowCommunicator.h"

@interface NonNetworkedStackOverflowCommunicator : StackOverflowCommunicator {
    
}

@property (copy) NSData *receivedData;

@end
