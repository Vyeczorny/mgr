//
// Created by Karol on 24.05.2018.
// Copyright (c) 2018 Karol Wieczorek. All rights reserved.
//

#import "PlaygroundTest.h"
#import "Benchmarks-Swift.h"

@interface PlaygroundTestObjC () <Test>

@property (nonatomic, assign) int n;

@end


@implementation PlaygroundTestObjC

- (instancetype)initWithN:(int)n {
    self = [super init];
    if (self != nil) {
        self.n = n;
    }
    return self;
}

- (void)run {
    // Do stuff
}

@end
