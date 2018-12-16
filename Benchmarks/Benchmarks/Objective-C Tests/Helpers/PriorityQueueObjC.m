//
// Created by Karol on 2018-12-09.
// Copyright (c) 2018 Karol Wieczorek. All rights reserved.
//

#import "PriorityQueueObjC.h"

@interface PriorityQueueObjC ()

@property (nonatomic, strong) NSMutableArray<id<QueueElementObjC>> *array;

@end

@implementation PriorityQueueObjC

- (instancetype _Nonnull)init {
    self = [super init];
    if (self != nil) {
        self.array = [NSMutableArray new];
    }
    return self;
}

- (NSUInteger)size {
    return self.array.count;
}

- (BOOL)isEmpty {
    return self.array.count == 0;
}

- (NSString *)description {

    NSMutableArray *strings = [NSMutableArray new];
    for (int i = 0; i < self.size; ++i) {
        [strings addObject:[NSString stringWithFormat:@"%@", self.array[i]]];
    }

    NSMutableString *string = [NSMutableString new];
    [string appendString:@"["];
    [string appendString:[strings componentsJoinedByString:@", "]];
    [string appendString:@"]"];

    return string;
}

- (void)insert:(id<QueueElementObjC> _Nonnull)element {
    [self.array addObject:element];
    [element setQueueIndex:self.size - 1];
    [self moveToTop:self.size - 1];
}

- (void)updateDecreasedElement:(NSUInteger)index {
    [self moveToTop:index];
}

- (id<QueueElementObjC> _Nonnull)removeMin {
    if (self.size == 1) {
        // there is only one element, so we just return it
        id<QueueElementObjC> lastElement = [self.array lastObject];
        [self.array removeLastObject];
        return lastElement;
    } else {
        id<QueueElementObjC> minElement = self.array[0];
        self.array[0] = [self.array lastObject];
        [self.array removeLastObject];
        [self.array[0] setQueueIndex:0];
        [self heapify:0];
        return minElement;
    }
}

#pragma mark - Private

- (void)moveToTop:(NSUInteger)index {

    if (index <= 0) { return; }

    NSUInteger parentIndex = (index + 1) / 2 - 1;

    id<QueueElementObjC> element = self.array[index];
    id<QueueElementObjC> parentElement = self.array[parentIndex];

    if (element.value < parentElement.value) {
        [self.array exchangeObjectAtIndex:index withObjectAtIndex:parentIndex];

        [element setQueueIndex:parentIndex];
        [parentElement setQueueIndex:index];

        [self moveToTop:parentIndex];
    }
}

- (void)heapify:(NSUInteger)index {
    NSUInteger leftIndex = (index + 1) * 2 - 1;
    NSUInteger rightIndex = (index + 1) * 2;

    NSUInteger smallestIndex = index;
    if (leftIndex < self.size && [self.array[leftIndex] value] < [self.array[smallestIndex] value]) {
        smallestIndex = leftIndex;
    }
    if (rightIndex < self.size && [self.array[rightIndex] value] < [self.array[smallestIndex] value]) {
        smallestIndex = rightIndex;
    }

    if (smallestIndex != index) {
        //swap elements
        [self.array exchangeObjectAtIndex:index withObjectAtIndex:smallestIndex];

        //swap indexes in elements
        [self.array[index] setQueueIndex:index];
        [self.array[smallestIndex] setQueueIndex:smallestIndex];

        [self heapify:smallestIndex];
    }
}

@end