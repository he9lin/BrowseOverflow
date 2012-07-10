//
//  UserBuilder.h
//  BrowseOverflow
//
//  Created by Lin He on 7/10/12.
//  Copyright (c) 2012 Heyook. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Person;

/**
 * Construct Person instances from dictionaries describing them.
 */
@interface UserBuilder : NSObject {
    
}
/**
 * Given a dictionary that describes a person on Stack Overflow, create
 * a Person object with the supplied properties.
 */
+ (Person *) personFromDictionary: (NSDictionary *) ownerValues;

@end
