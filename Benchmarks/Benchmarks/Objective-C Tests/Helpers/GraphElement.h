//
// Created by Karol on 2018-12-09.
// Copyright (c) 2018 Karol Wieczorek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PriorityQueueObjC.h"

extern NSUInteger const EMPTY_INDEX;
extern NSUInteger const MAX_DISTANCE;

@interface GraphElement : NSObject <QueueElementObjC>

@property (nonatomic, assign) NSUInteger nodeIndex;
@property (nonatomic, assign) NSUInteger distance;
@property (nonatomic, assign) BOOL alreadyComputed;

@property (nonatomic, assign) NSUInteger queueIndex;
@property (nonatomic, assign) NSUInteger value;

- (instancetype _Nonnull)initWithNodeIndex:(NSUInteger)nodeIndex distance:(NSUInteger)distance;

@end