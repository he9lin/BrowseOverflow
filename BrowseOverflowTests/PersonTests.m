//
//  PersonTests.m
//  BrowseOverflow
//
//  Created by Lin He on 7/9/12.
//  Copyright (c) 2012 Heyook. All rights reserved.
//

#import "Person.h"
#import "PersonTests.h"

@implementation PersonTests 
{
    Person* person;
}

- (void)setUp {
    person = [[Person alloc] initWithName: @"Graham Lee"
                           avatarLocation: @"http://example.com/avatar.png"];
}

- (void)tearDown {
    person = nil;
}

- (void)testThatPersonHasTheRightName {
    STAssertEqualObjects(person.name, @"Graham Lee",
                         @"expecting a person to provide its name");
}

- (void)testThatPersonHasAnAvatarURL {
    NSURL *url = person.avatarURL;
    STAssertEqualObjects([url absoluteString],
                         @"http://example.com/avatar.png",
                         @"The Person’s avatar should be represented by a URL");
}

@end
