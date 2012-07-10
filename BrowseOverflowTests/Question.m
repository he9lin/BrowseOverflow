//
//  Question.m
//  BrowseOverflow
//
//  Created by Lin He on 7/9/12.
//  Copyright (c) 2012 Heyook. All rights reserved.
//

#import "Question.h"
#import "Answer.h"

@implementation Question

@synthesize date;
@synthesize title;
@synthesize score;

- (id)init {
    if ((self = [super init])) {
        answerSet = [[NSMutableSet alloc] init];
    }
    return self;
}

- (void)addAnswer:(Answer *)answer {
    [answerSet addObject: answer];
}

- (NSArray *)answers {
    return [[answerSet allObjects]
            sortedArrayUsingSelector: @selector(compare:)];
}

@end
