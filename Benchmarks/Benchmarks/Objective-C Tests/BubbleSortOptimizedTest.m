//
// Created by Karol on 05.07.2018.
// Copyright (c) 2018 Karol Wieczorek. All rights reserved.
//

#import "BubbleSortOptimizedTest.h"
#import "Benchmarks-Swift.h"

@interface BubbleSortOptimizedTestObjC ()

@property (nonatomic, assign) int n;

@end

@implementation BubbleSortOptimizedTestObjC

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
    int n = self.n;
    SEL exchangeObjectSelector = @selector(exchangeObjectAtIndex:withObjectAtIndex:);
    IMP exchangeObjectImplementation = [array methodForSelector:exchangeObjectSelector];
    for (NSUInteger i = 0; i < n - 1; ++i) {
        for (NSUInteger j = 1; j < n - i; ++j) {
            if (array[j] < array[j-1]) {
                ((void (*)(id, SEL, NSUInteger, NSUInteger))exchangeObjectImplementation)(array, exchangeObjectSelector, j, j-1);
            }
        }
    }
    return array;
}

@end