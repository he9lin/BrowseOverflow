//
//  QuestionBuilder.h
//  BrowseOverflow
//
//  Created by Lin He on 7/10/12.
//  Copyright (c) 2012 Heyook. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuestionBuilder : NSObject

- (NSArray *)questionsFromJSON: (NSString *)objectNotation
                         error: (NSError **)error;

@end

extern NSString *QuestionBuilderErrorDomain;

enum {
    QuestionBuilderInvalidJSONError
};