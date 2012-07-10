//
//  Question.h
//  BrowseOverflow
//
//  Created by Lin He on 7/9/12.
//  Copyright (c) 2012 Heyook. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Answer;

@interface Question : NSObject {
    NSMutableSet *answerSet;
}

@property (retain) NSDate *date;
@property (copy) NSString *title;
@property NSInteger score;
@property (readonly) NSArray *answers;

- (void)addAnswer: (Answer *)answer;

@end


