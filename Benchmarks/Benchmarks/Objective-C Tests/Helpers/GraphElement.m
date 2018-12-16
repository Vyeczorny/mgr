//
// Created by Karol on 2018-12-09.
// Copyright (c) 2018 Karol Wieczorek. All rights reserved.
//

#import "GraphElement.h"

NSUInteger const EMPTY_INDEX = UINT32_MAX;
NSUInteger const MAX_DISTANCE = UINT32_MAX / 2;

@implementation GraphElement

- (instancetype _Nonnull)initWithNodeIndex:(NSUInteger)nodeIndex distance:(NSUInteger)distance {
    self = [super init];
    if (self != nil) {
        self.alreadyComputed = false;
        self.nodeIndex = nodeIndex;
        self.distance = distance;
        self.queueIndex = EMPTY_INDEX;
    }
    return self;
}

- (NSUInteger)value {
    return self.distance;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"<I: %lu D: %lu Q:%lu>", self.nodeIndex, self.distance, self.queueIndex];
}

@end