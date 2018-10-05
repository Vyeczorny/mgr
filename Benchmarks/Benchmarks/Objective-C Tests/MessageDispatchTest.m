//
// Created by Karol on 05/10/2018.
// Copyright (c) 2018 Karol Wieczorek. All rights reserved.
//

#import "MessageDispatchTest.h"
#import "Benchmarks-Swift.h"
#import "MultiplyByTwo.h"

@interface MessageDispatchTestObjC ()

@property (nonatomic, strong) NSArray<MultiplyByTwo *>* inputData;

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
    for (MultiplyByTwo *input in self.inputData) {
        [input multiply];
    }
}

@end