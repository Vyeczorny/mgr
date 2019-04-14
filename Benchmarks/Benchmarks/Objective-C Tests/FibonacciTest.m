//
// Created by Karol on 28.03.2018.
// Copyright (c) 2018 Karol Wieczorek. All rights reserved.
//

#import "FibonacciTest.h"
#import "Benchmarks-Swift.h"

@interface FibonacciTestObjC () <Test>

@property (nonatomic, assign) int n;

@end

@implementation FibonacciTestObjC

- (instancetype)initWithN:(int)n {
    self = [super init];
    if (self != nil) {
        self.n = n;
    }
    return self;
}

- (void)run {
    [self fibonacciForN:self.n];
}

- (int64_t)fibonacciForN:(int)n {
    if (n == 0) {
        return 0;
    } else if (n == 1) {
        return 1;
    } else {
        return [self fibonacciForN:n - 1] + [self fibonacciForN:n - 2];
    }
}

@end
