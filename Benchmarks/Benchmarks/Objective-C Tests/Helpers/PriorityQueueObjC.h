//
// Created by Karol on 2018-12-09.
// Copyright (c) 2018 Karol Wieczorek. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol QueueElementObjC

- (NSUInteger)queueIndex;
- (void)setQueueIndex:(NSUInteger)index;
- (NSUInteger)value;
- (void)setValue:(NSUInteger)value;

@end

@interface PriorityQueueObjC : NSObject

- (instancetype _Nonnull)init;

- (BOOL)isEmpty;
- (void)insert:(id<QueueElementObjC> _Nonnull)element;
- (void)updateDecreasedElement:(NSUInteger)index;
- (id<QueueElementObjC> _Nonnull)removeMin;

@end