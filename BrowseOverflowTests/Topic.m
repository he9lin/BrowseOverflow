//
//  Topic.m
//  BrowseOverflow
//
//  Created by Lin He on 7/9/12.
//  Copyright (c) 2012 Heyook. All rights reserved.
//

#import "Question.h"
#import "Topic.h"

@implementation Topic {
    NSArray *questions;
}

@synthesize name, tag;

- (id)initWithName:(NSString *)newName tag:(NSString *)newTag {
    if (self = [super init]) {
        name = [newName copy];
        tag  = [newTag copy];
        questions = [[NSArray alloc] init];
    }
    return self;
}

- (NSArray *)recentQuestions {
    return [questions sortedArrayUsingComparator: ^(id obj1, id obj2) {
        Question *q1 = (Question *)obj1;
        Question *q2 = (Question *)obj2;
        return [q2.date compare: q1.date];
    }];
}

- (void)addQuestion: (Question *)question {
    questions = [questions arrayByAddingObject: question];
}

@end
