//
//  Person.m
//  BrowseOverflow
//
//  Created by Lin He on 7/9/12.
//  Copyright (c) 2012 Heyook. All rights reserved.
//

#import "Person.h"

@implementation Person

@synthesize name, avatarURL;

- (id)initWithName:(NSString *)aName avatarLocation:(NSString *)location {
    if ((self = [super init])) {
        name = [aName copy];
        avatarURL = [[NSURL alloc] initWithString: location];
    }
    return self;
}

@end
