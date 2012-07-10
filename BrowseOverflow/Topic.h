//
//  Topic.h
//  BrowseOverflow
//
//  Created by Lin He on 7/9/12.
//  Copyright (c) 2012 Heyook. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Question;

@interface Topic : NSObject {
    NSArray *questions;
}

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *tag;

- (id)initWithName:(NSString *)newName tag:(NSString *)newTag;
- (NSArray *)recentQuestions;
- (void)addQuestion: (Question *)question;
- (NSArray *)sortQuestionsLatestFirst: (NSArray *)questionList;

@end
