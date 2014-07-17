//
//  PuzzleTests.m
//  PuzzleTests
//
//  Created by BSA univ 1 on 20/06/14.
//  Copyright (c) 2014 hibrise. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ViewController.h"
@interface PuzzleTests : XCTestCase
@property ViewController * ViewControllerObj;

@end

@implementation PuzzleTests

@synthesize ViewControllerObj;

- (void)setUp
{
    [super setUp];
  UIStoryboard * storyboard= [UIStoryboard storyboardWithName:@"Main" bundle:nil];
   self.ViewControllerObj = [storyboard instantiateViewControllerWithIdentifier:@"main"];

}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
}
-(void) testSimplePass
{
    NSLog(@"%@ end",self.name);
    
    
}
@end
