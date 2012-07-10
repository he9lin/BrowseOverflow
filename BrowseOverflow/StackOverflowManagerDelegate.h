//
//  StackOverflowManagerDelegate.h
//  BrowseOverflow
//
//  Created by Lin He on 7/9/12.
//  Copyright (c) 2012 Heyook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Topic.h"

@protocol StackOverflowManagerDelegate <NSObject>

/**
 * The manager was unable to retrieve questions from Stack Overflow.
 */
- (void)fetchingQuestionsFailedWithError: (NSError *)error;

@end
