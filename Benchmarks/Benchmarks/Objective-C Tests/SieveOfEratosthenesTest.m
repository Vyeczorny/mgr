//
// Created by Karol Wieczorek on 2019-02-09.
// Copyright (c) 2019 Karol Wieczorek. All rights reserved.
//

#import "SieveOfEratosthenesTest.h"
#import "Benchmarks-Swift.h"

@interface SieveOfEratosthenesTestObjC () <Test>

@property (nonatomic, assign) int n;

@end

@implementation SieveOfEratosthenesTestObjC

- (instancetype)initWithN:(int)n {
    self = [super init];
    if (self != nil) {
        self.n = n;
    }
    return self;
}

- (void)run {
    NSMutableData *data = [NSMutableData dataWithLength:sizeof(BOOL) * self.n];
    BOOL *isPrime = [data mutableBytes];

    for (int i = 0; i < self.n; ++i) {
        isPrime[i] = YES;
    }

    for (int prime = 2; prime <= ceil(sqrt(self.n)); ++prime) {
        for (int i = prime + 1; i < self.n; ++i) {
            if (i % prime == 0) {
                isPrime[i] = NO;
            }
        }
    }
}


@end
