//
//  StackOverflowManager.h
//  BrowseOverflow
//
//  Created by Lin He on 7/9/12.
//  Copyright (c) 2012 Heyook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StackOverflowManagerDelegate.h"

@class StackOverflowCommunicator;
@class Topic;

/**
 * A façade providing access to the Stack Overflow service.
 * Application code should only use this class to get at Stack Overflow innards.
 */
@interface StackOverflowManager : NSObject

@property (weak, nonatomic) id <StackOverflowManagerDelegate> delegate;
@property (strong) StackOverflowCommunicator *communicator;

/**
 * Retrieve questions on a given topic from Stack Overflow.
 * @note The delegate will receive messages when new information
 *       arrives, and this class will ask the delegate if it needs
 *       guidance.
 * @param topic The subject on which to find questions.
 * @see StackOverflowManagerDelegate
 */
- (void)fetchQuestionsOnTopic:(Topic *)topic;

- (void)searchingForQuestionsFailedWithError:(NSError *)error;

@end

extern NSString *StackOverflowManagerError;

enum {
    StackOverflowManagerErrorQuestionSearchCode,
    StackOverflowManagerErrorQuestionBodyFetchCode,
    StackOverflowManagerErrorAnswerFetchCode
};