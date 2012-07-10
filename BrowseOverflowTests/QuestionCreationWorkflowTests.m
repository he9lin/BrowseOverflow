//
//  QuestionCreationTests.m
//  BrowseOverflow
//
//  Created by Lin He on 7/9/12.
//  Copyright (c) 2012 Heyook. All rights reserved.
//

#import "QuestionCreationWorkflowTests.h"
#import "StackOverflowManager.h"
#import "MockStackOverflowManagerDelegate.h"
#import "MockStackOverflowCommunicator.h"
#import "Topic.h"
#import "FakeQuestionBuilder.h"
#import "Question.h"

@implementation QuestionCreationWorkflowTests
{
@private
    StackOverflowManager *mgr;
    MockStackOverflowManagerDelegate *delegate;
    NSError *underlyingError;
    MockStackOverflowCommunicator *communicator;
    FakeQuestionBuilder *questionBuilder;
    NSArray *questionArray;
}

- (void)setUp {
    mgr = [[StackOverflowManager alloc] init];
    
    delegate = [[MockStackOverflowManagerDelegate alloc] init];
    mgr.delegate = delegate;
    
    underlyingError = [NSError errorWithDomain: @"Test domain"
                                          code: 0 
                                      userInfo: nil];
    
    communicator = [[MockStackOverflowCommunicator alloc] init];
    mgr.communicator = communicator;
    
    questionBuilder = [[FakeQuestionBuilder alloc] init];
    questionBuilder.arrayToReturn = nil;
    mgr.questionBuilder = questionBuilder;
    
    Question *question = [[Question alloc] init];
    questionArray = [NSArray arrayWithObject: question];
}

- (void)tearDown {
    mgr = nil;
    delegate = nil;
    underlyingError = nil;
    communicator = nil;
    questionBuilder = nil;
    questionArray = nil;
}

- (void)testNonConformingObjectCannotBeDelegate {
    STAssertThrows(mgr.delegate = (id <StackOverflowManagerDelegate>)[NSNull null],
                   @"NSNull should not be used as the delegate as doesn't"
                   @" conform to the delegate protocol");
}

- (void)testConformingObjectCanBeDelegate {
    id <StackOverflowManagerDelegate> delegate = [[MockStackOverflowManagerDelegate alloc] init];
    STAssertNoThrow(mgr.delegate = delegate,
                    @"Object conforming to the delegate protocol should be used"
                    @" as the delegate");
}

- (void)testManagerAcceptsNilAsADelegate {
    STAssertNoThrow(mgr.delegate = nil,
                    @"It should be acceptable to use nil as an object’s delegate");
}

- (void)testAskingForQuestionsMeansRequestingData {
    Topic *topic = [[Topic alloc] initWithName: @"iPhone"
                                           tag: @"iphone"];
    [mgr fetchQuestionsOnTopic: topic];
    STAssertTrue([communicator wasAskedToFetchQuestions],
                 @"The communicator should need to fetch data.");
}

- (void)testErrorReturnedToDelegateIsNotErrorNotifiedByCommunicator {
    [mgr searchingForQuestionsFailedWithError: underlyingError];
    STAssertFalse(underlyingError == [delegate fetchError],
                  @"Error should be at the correct level of abstraction");
}

- (void)testErrorReturnedToDelegateDocumentsUnderlyingError {
    [mgr searchingForQuestionsFailedWithError: underlyingError];
    STAssertEqualObjects([[[delegate fetchError] userInfo]
                          objectForKey: NSUnderlyingErrorKey], underlyingError,
                          @"The underlying error should be available to client code");
}

- (void)testQuestionJSONIsPassedToQuestionBuilder {
    [mgr receivedQuestionsJSON: @"Fake JSON"];
    STAssertEqualObjects(questionBuilder.JSON, @"Fake JSON",
                         @"Downloaded JSON is sent to the builder");
}

- (void)testDelegateNotifiedOfErrorWhenQuestionBuilderFails {
    questionBuilder.errorToSet = underlyingError;
    [mgr receivedQuestionsJSON: @"Fake JSON"];
    STAssertNotNil([[[delegate fetchError] userInfo]
                    objectForKey: NSUnderlyingErrorKey],
                   @"The delegate should have found out about the error");
}

- (void)testDelegateNotToldAboutErrorWhenQuestionsReceived {
    questionBuilder.arrayToReturn = questionArray;
    [mgr receivedQuestionsJSON: @"Fake JSON"];
    STAssertNil([delegate fetchError], @"No error should be received on success");
}

- (void)testDelegateReceivesTheQuestionsDiscoveredByManager {
    questionBuilder.arrayToReturn = questionArray;
    [mgr receivedQuestionsJSON: @"Fake JSON"];
    STAssertEqualObjects([delegate fetchedQuestions], 
                         questionArray, 
                         @"The manager should have sent its questions to the delegate");
}

@end
