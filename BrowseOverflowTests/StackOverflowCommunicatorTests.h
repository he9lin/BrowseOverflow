//
//  StackOverflowCommunicatorTests.h
//  BrowseOverflow
//
//  Created by Lin He on 7/10/12.
//  Copyright (c) 2012 Heyook. All rights reserved.
//

//  Logic unit tests contain unit test code that is designed to be linked into an independent test executable.
//  See Also: http://developer.apple.com/iphone/library/documentation/Xcode/Conceptual/iphone_development/135-Unit_Testing_Applications/unit_testing_applications.html

#import <SenTestingKit/SenTestingKit.h>

@class InspectableStackOverflowCommunicator;
@class NonNetworkedStackOverflowCommunicator;
@class MockStackOverflowManager;
@class FakeURLResponse;

@interface StackOverflowCommunicatorTests : SenTestCase {
    InspectableStackOverflowCommunicator *communicator;
    NonNetworkedStackOverflowCommunicator *nnCommunicator;
    MockStackOverflowManager *manager;
    FakeURLResponse *fourOhFourResponse;
    NSData *receivedData;
}

@end
