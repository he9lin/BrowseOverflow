//
//  Person.h
//  BrowseOverflow
//
//  Created by Lin He on 7/9/12.
//  Copyright (c) 2012 Heyook. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
    
@property (readonly, strong) NSString* name;
@property (readonly, strong) NSURL* avatarURL;

- (id)initWithName:(NSString *)aName avatarLocation:(NSString *)location;

@end
