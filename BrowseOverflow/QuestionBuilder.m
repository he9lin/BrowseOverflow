//
//  QuestionBuilder.m
//  BrowseOverflow
//
//  Created by Lin He on 7/10/12.
//  Copyright (c) 2012 Heyook. All rights reserved.
//

#import "QuestionBuilder.h"

@implementation QuestionBuilder

- (NSArray *)questionsFromJSON:(NSString *)objectNotation
                         error:(NSError **)error {
    NSParameterAssert(objectNotation != nil);
    if (error != NULL) {
        *error = [NSError errorWithDomain: QuestionBuilderErrorDomain
                                     code: QuestionBuilderInvalidJSONError userInfo: nil];
    }
    return nil;
}

@end

NSString *QuestionBuilderErrorDomain = @"QuestionBuilderErrorDomain";