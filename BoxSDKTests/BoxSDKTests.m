//
//  BoxSDKTests.m
//  BoxSDKTests
//
//  Created on 2/19/13.
//  Copyright (c) 2013 Box. All rights reserved.
//
//  NOTE: this file is a mirror of BoxCocoaSDKTests/BoxCocoaSDKTests.m. Changes made here should be reflected there.
//

#import "BoxSDKTests.h"

#import "BoxSDKController.h"

@implementation BoxSDKTests

- (void)setUp
{
    SDK = [[BoxSDKController alloc] init];
    SDK.OAuth2Session = [[BoxSerialOAuth2Session alloc] init];
    SDK.APIBaseURL = BoxAPIBaseURL;
}

- (void)testThatSDKURLAndOAuth2URLAreKeptInSyncBySetter
{
    NSString *APIBaseURL = @"https://dick.in.a.box.com/api";

    // precondition
    STAssertFalse([SDK.OAuth2Session.APIBaseURLString isEqualToString:APIBaseURL], @"OAuth2 base URL is not different from test target URL");

    SDK.APIBaseURL = APIBaseURL;

    STAssertEqualObjects(SDK.APIBaseURL, SDK.OAuth2Session.APIBaseURLString, @"Shared SDK and OAuth2 base URLs are not in sync");

}

- (void)testThatSDKAndOAuth2SessionAreConstructedWithSameAPIUrl
{
    STAssertEquals([BoxSDKController sharedSDK].APIBaseURL, [BoxSDKController sharedSDK].OAuth2Session.APIBaseURLString, @"BoxSDKController and OAuth2Session were not constructed with the same API base URL");
}

- (void)testThatSingletonSDKIsOnlyInstantiatedOnce
{
    BoxSDKController *firstSingletonSDK = [BoxSDKController sharedSDK];
    BoxSDKController *secondSingletonSDK = [BoxSDKController sharedSDK];

    STAssertTrue(firstSingletonSDK == secondSingletonSDK, @"multiple invocations of [BoxSDKController sharedSDK] should refer to the same object");
}

@end
