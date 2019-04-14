//
// Created by Karol Wieczorek on 2019-02-13.
// Copyright (c) 2019 Karol Wieczorek. All rights reserved.
//

#import "SumOfIntegersTest.h"
#import "Benchmarks-Swift.h"

@interface SumOfIntegersTestObjC () <Test>

@property(nonatomic, strong) NSArray<NSNumber *> *numbers;

@end


@implementation SumOfIntegersTestObjC

- (nonnull instancetype)initWithN:(int)n {
    self = [super init];
    if (self != nil) {
        self.numbers = [self generateArrayOfIntegersWithN:n];
    }
    return self;
}

- (void)run {
    long long int sum = 0;

    NSArray<NSNumber *> *numbers = self.numbers;
    NSUInteger n = numbers.count;

    for (int i = 0; i < n; ++i) {
        sum += [numbers[i] integerValue];
    }
}

- (NSArray<NSNumber *> *)generateArrayOfIntegersWithN:(int)n {
    NSMutableArray *array = [@[] mutableCopy];

    for (int j = 0; j < 100; ++j) {
        for (int i = 0; i < n; ++i) {
            [array addObject:@(arc4random() % 100)];
        }
    }

    return array;
}

@end
