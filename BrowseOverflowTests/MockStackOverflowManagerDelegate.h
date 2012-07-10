//
//  MockStackOverflowManagerDelegate.h
//  BrowseOverflow
//
//  Created by Lin He on 7/9/12.
//  Copyright (c) 2012 Heyook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StackOverflowManagerDelegate.h"

@interface MockStackOverflowManagerDelegate : NSObject <StackOverflowManagerDelegate>

@property (strong) NSError *fetchError;

- (BOOL)wasAskedToFetchQuestions;

@end
