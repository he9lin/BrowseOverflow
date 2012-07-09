//
//  Question.h
//  BrowseOverflow
//
//  Created by Lin He on 7/9/12.
//  Copyright (c) 2012 Heyook. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Question : NSObject

@property (nonatomic, strong) NSDate* date;
@property (nonatomic, strong) NSString* title;
@property (nonatomic, assign) NSInteger score;

@end
