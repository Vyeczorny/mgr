//
// Created by Karol on 2018-12-09.
// Copyright (c) 2018 Karol Wieczorek. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Test;

@interface DijkstraOptimizedTestObjC : NSObject <Test>

- (nonnull instancetype)initWithN:(int)n;
- (nonnull instancetype)initWithAdjacencyMatrix:(NSArray<NSArray<NSNumber *> *> *)matrix;
- (void)run;

// temporary
- (NSArray<NSNumber *> * _Nonnull)dijkstra;

@end