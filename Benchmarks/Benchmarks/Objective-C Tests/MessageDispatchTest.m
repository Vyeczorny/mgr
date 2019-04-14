//
// Created by Karol on 05/10/2018.
// Copyright (c) 2018 Karol Wieczorek. All rights reserved.
//

#import "MessageDispatchTest.h"
#import "Benchmarks-Swift.h"
#import "MultiplyByTwoProtocol.h"
#import "MultiplyByTwo.h"

@interface MessageDispatchTestObjC () <Test>

@property (nonatomic, strong) NSArray<id<MultiplyByTwoProtocol>>* inputData;

@end

@implementation MessageDispatchTestObjC

- (instancetype)initWithN:(int)n {
    self = [super init];
    if (self != nil) {
        NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:n];
        for (int i = 0; i < n; ++i) {
            array[i] = [[MultiplyByTwo alloc] initWithN:arc4random()];
        }
        self.inputData = array;
    }
    return self;
}

- (void)run {
    int output = 0;
    for (id<MultiplyByTwoProtocol> input in self.inputData) {
        output += [input multiply];
    }
}

@end
