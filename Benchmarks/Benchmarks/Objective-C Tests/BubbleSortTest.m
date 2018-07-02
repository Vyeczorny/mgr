//
// Created by Karol on 29.05.2018.
// Copyright (c) 2018 Karol Wieczorek. All rights reserved.
//

#import "BubbleSortTest.h"
#import "Benchmarks-Swift.h"

@interface BubbleSortTestObjC ()

@property (nonatomic, assign) int n;

@end


@implementation BubbleSortTestObjC

- (nonnull instancetype)initWithN:(int)n {
    self = [super init];
    if (self != nil) {
        self.n = n;
    }
    return self;
}

- (void)run {
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:self.n];
    for (int i = 0; i < self.n; ++i) {
        array[i] = @(arc4random());
    }
    [self bubbleSortWithArray:array];
}

- (NSArray *)bubbleSortWithArray:(NSMutableArray *)array {
    for (NSUInteger i = 0; i < self.n - 1; ++i) {
        for (NSUInteger j = 1; j < self.n - i; ++j) {
            if (array[j] < array[j-1]) {
                NSNumber *temp = array[j];
                array[j] = array[j-1];
                array[j-1] = temp;
            }
        }
    }
    return array;
}

@end