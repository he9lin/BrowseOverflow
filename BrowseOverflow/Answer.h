//
//  Answer.h
//  BrowseOverflow
//
//  Created by Lin He on 7/9/12.
//  Copyright (c) 2012 Heyook. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Person;

@interface Answer : NSObject {
    
}

@property (copy) NSString *text;
@property (retain) Person *person;
@property (getter=isAccepted) BOOL accepted;
@property NSInteger score;

- (NSComparisonResult)compare: (Answer *)otherAnswer;

@end
