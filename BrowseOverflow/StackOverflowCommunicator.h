//
//  StackOverflowCommunicator.h
//  BrowseOverflow
//
//  Created by Lin He on 7/9/12.
//  Copyright (c) 2012 Heyook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StackOverflowCommunicatorDelegate.h"

@interface StackOverflowCommunicator : NSObject <NSURLConnectionDataDelegate> {
@protected
    NSURL *fetchingURL;
    NSURLConnection *fetchingConnection;
    NSMutableData *receivedData;
@private
    id <StackOverflowCommunicatorDelegate> __weak delegate;
    void (^errorHandler)(NSError *);
    void (^successHandler)(NSString *);
}

@property (weak) id <StackOverflowCommunicatorDelegate> delegate;

- (void)searchForQuestionsWithTag: (NSString *)tag;
- (void)downloadInformationForQuestionWithID: (NSInteger)identifier;
- (void)downloadAnswersToQuestionWithID: (NSInteger)identifier;

- (void)cancelAndDiscardURLConnection;

@end

extern NSString *StackOverflowCommunicatorErrorDomain;
