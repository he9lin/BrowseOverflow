//
//  FakeQuestionBuilder.m
//  BrowseOverflow
//
//  Created by Lin He on 7/10/12.
//  Copyright (c) 2012 Heyook. All rights reserved.
//

#import "FakeQuestionBuilder.h"
#import "Question.h"

@implementation FakeQuestionBuilder

@synthesize JSON;
@synthesize arrayToReturn;
@synthesize errorToSet;

- (NSArray *)questionsFromJSON: (NSString *)objectNotation
                         error: (NSError **)error {
    self.JSON = objectNotation;
    if (error) {
        *error = errorToSet;
    }
    return arrayToReturn;
}

@end
