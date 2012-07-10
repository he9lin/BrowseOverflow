//
//  QuestionBuilder.h
//  BrowseOverflow
//
//  Created by Lin He on 7/10/12.
//  Copyright (c) 2012 Heyook. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Question;

@interface QuestionBuilder : NSObject {
    
}
/**
 * Given a string containing a JSON dictionary, return a list of Question objects.
 * @param objectNotation The JSON string
 * @param error By-ref error signalling
 * @return An array of Question objects, or nil (with error set) if objectNotation cannot be parsed.
 * @see Question
 */
- (NSArray *)questionsFromJSON: (NSString *)objectNotation error: (NSError **)error;

/**
 * Add information to a Question object based on a JSON dictionary.
 * @param objectNotation The JSON string
 * @param question The question to fill in
 * @note Due to the design of the Stack Exchange API, it's possible for
 *       this method not to change the content of the Question object.
 *       This is not considered an error.
 * @see Question
 */
- (void)fillInDetailsForQuestion: (Question *)question fromJSON: (NSString *)objectNotation;

@end

extern NSString *QuestionBuilderErrorDomain;

enum {
    QuestionBuilderInvalidJSONError,
    QuestionBuilderMissingDataError
};