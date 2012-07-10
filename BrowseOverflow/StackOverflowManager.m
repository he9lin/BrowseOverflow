//
//  StackOverflowManager.m
//  BrowseOverflow
//
//  Created by Lin He on 7/9/12.
//  Copyright (c) 2012 Heyook. All rights reserved.
//

#import "StackOverflowManager.h"

@implementation StackOverflowManager

@synthesize delegate;

- (void)setDelegate:(id<StackOverflowManagerDelegate>)newDelegate {
    if (newDelegate && ![newDelegate conformsToProtocol:
          @protocol(StackOverflowManagerDelegate)]) {
        [[NSException exceptionWithName: NSInvalidArgumentException
                                 reason:
          @"Delegate object does not conform to the delegate protocol"
                               userInfo: nil] raise];
    }
    delegate = newDelegate;
}

@end
