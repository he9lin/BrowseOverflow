//
//  StackOverflowManager.m
//  BrowseOverflow
//
//  Created by Lin He on 7/9/12.
//  Copyright (c) 2012 Heyook. All rights reserved.
//

#import "StackOverflowManager.h"
#import "StackOverflowCommunicator.h"
#import "Topic.h"
#import "QuestionBuilder.h"

@interface StackOverflowManager ()

- (void)tellDelegateAboutQuestionSearchError: (NSError *)underlyingError;

@end

@implementation StackOverflowManager

@synthesize delegate, communicator;
@synthesize questionBuilder;

- (void)setDelegate:(id<StackOverflowManagerDelegate>)newDelegate {
    if (newDelegate && ![newDelegate conformsToProtocol:
          @protocol(StackOverflowManagerDelegate)]) {
        [[NSException exceptionWithName: NSInvalidArgumentException
                                 reason: @"Delegate object does not conform to the delegate protocol"
                               userInfo: nil] raise];
    }
    delegate = newDelegate;
}

#pragma mark Questions

- (void)fetchQuestionsOnTopic:(Topic *)topic {
    [communicator searchForQuestionsWithTag: [topic tag]];
}

- (void)searchingForQuestionsFailedWithError:(NSError *)error {
    [self tellDelegateAboutQuestionSearchError: error];
}

- (void)receivedQuestionsJSON:(NSString *)objectNotation {
    NSError *error = nil;
    NSArray *questions = [questionBuilder
                          questionsFromJSON: objectNotation error: &error];
    if (!questions) {
        NSDictionary *errorInfo = nil;
        if (error) {
            errorInfo = [NSDictionary dictionaryWithObject: error
                                                    forKey: NSUnderlyingErrorKey];
        }
        NSError *reportableError = [NSError
                                    errorWithDomain: StackOverflowManagerError
                                    code: StackOverflowManagerErrorQuestionSearchCode
                                    userInfo: errorInfo];
        [delegate fetchingQuestionsFailedWithError: reportableError];
    }
}

#pragma mark Class Continuation

- (void)tellDelegateAboutQuestionSearchError:(NSError *)underlyingError {
    NSDictionary *errorInfo = nil;
    if (underlyingError) {
        errorInfo = [NSDictionary dictionaryWithObject: underlyingError forKey: NSUnderlyingErrorKey];
    }
    NSError *reportableError = [NSError 
                    errorWithDomain: StackOverflowManagerError 
                               code: StackOverflowManagerErrorQuestionSearchCode 
                           userInfo: errorInfo];
    [delegate fetchingQuestionsFailedWithError:reportableError];
}

@end

NSString *StackOverflowManagerError = @"StackOverflowManagerError";