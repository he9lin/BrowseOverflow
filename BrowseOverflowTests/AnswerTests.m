//
//  AnswerTests.m
//  BrowseOverflow
//
//  Created by Lin He on 7/9/12.
//  Copyright (c) 2012 Heyook. All rights reserved.
//

#import "Answer.h"
#import "Person.h"
#import "AnswerTests.h"

@implementation AnswerTests

- (void)setUp {
    answer = [[Answer alloc] init];
    answer.text = @"The answer is 42";
    answer.person = [[Person alloc] initWithName: @"Graham Lee"
                                  avatarLocation: @"http://example.com/avatar.png"];
    answer.score = 42;
    
    otherAnswer = [[Answer alloc] init];
    otherAnswer.text = @"I have the answer you need";
    otherAnswer.score = 42;
}

- (void)tearDown {
    answer = nil;
    otherAnswer = nil;
}

- (void)testAnswerHasSomeText {
    STAssertEqualObjects(answer.text, @"The answer is 42",
                         @"Answers need to contain some text");
}

- (void)testSomeoneProvidedTheAnswer {
    STAssertTrue([answer.person isKindOfClass: [Person class]],
                 @"A Person gave this Answer");
}

- (void)testAnswersNotAcceptedByDefault {
    STAssertFalse(answer.accepted, @"Answer not accepted by default");
}

- (void)testAnswerCanBeAccepted {
    STAssertNoThrow(answer.accepted = YES,
                    @"It is possible to accept an answer");
}

- (void)testAnswerHasAScore {
    STAssertTrue(answer.score == 42,
                 @"Answer's score can be retrieved");
}

- (void)testAcceptedAnswerComesBeforeUnaccepted {
    otherAnswer.accepted = YES;
    otherAnswer.score = answer.score + 10;
    STAssertEquals([answer compare: otherAnswer], NSOrderedDescending,
                   @"Accepted answer should come first");
    STAssertEquals([otherAnswer compare: answer], NSOrderedAscending,
                   @"Unaccepted answer should come last");
}

- (void)testAnswersWithEqualScoresCompareEqually {
    STAssertEquals([answer compare: otherAnswer], NSOrderedSame,
                   @"Both answers of equal rank");
    STAssertEquals([otherAnswer compare: answer], NSOrderedSame,
                   @"Each answer has the same rank");
}

- (void)testLowerScoringAnswerComesAfterHigher {
    otherAnswer.score = answer.score + 10;
    STAssertEquals([answer compare: otherAnswer], NSOrderedDescending,
                   @"Higher score comes first");
    STAssertEquals([otherAnswer compare: answer], NSOrderedAscending,
                   @"Lower score comes last");
}

@end
