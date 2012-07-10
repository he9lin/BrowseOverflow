//
//  FakeURLResponse.m
//  BrowseOverflow
//
//  Created by Lin He on 7/10/12.
//  Copyright (c) 2012 Heyook. All rights reserved.
//

#import "FakeURLResponse.h"

@implementation FakeURLResponse

- (id)initWithStatusCode:(NSInteger)code {
    if ((self = [super init])) {
        statusCode = code;
    }
    return self;
}

- (NSInteger)statusCode {
    return statusCode;
}


@end
