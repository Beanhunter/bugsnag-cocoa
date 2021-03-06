//
//  BugsnagTests.m
//  BugsnagTests
//
//  Created by Conrad Irwin on 11/6/14.
//
//

#import "Bugsnag.h"
#import <Foundation/Foundation.h>
#import <XCTest/XCTest.h>

@interface BugsnagTests : XCTestCase

@end

@implementation BugsnagTests

// Ensure that Bugsnag deals with nil exception names appropriately
// KSCrash can crash itself if a nil name is passed through
- (void)testNotifyWithNilName {
  [Bugsnag startBugsnagWithApiKey:@"123456789012345678901234"];
  NSString *nilName = nil;
  NSException *exception =
      [NSException exceptionWithName:nilName reason:nil userInfo:nil];
  [Bugsnag notify:exception];
  XCTAssert(YES, @"Pass");
}

@end
