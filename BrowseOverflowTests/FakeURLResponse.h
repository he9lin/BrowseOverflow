//
//  FakeURLResponse.h
//  BrowseOverflow
//
//  Created by Lin He on 7/10/12.
//  Copyright (c) 2012 Heyook. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FakeURLResponse : NSObject {
    NSInteger statusCode;
}

- (id)initWithStatusCode: (NSInteger)code;
- (NSInteger)statusCode;

@end
