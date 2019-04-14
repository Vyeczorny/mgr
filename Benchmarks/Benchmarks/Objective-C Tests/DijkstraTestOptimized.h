//
// Created by Karol on 2018-12-09.
// Copyright (c) 2018 Karol Wieczorek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DijkstraOptimizedTestObjC : NSObject

- (nonnull instancetype)initWithN:(int)n;
- (nonnull instancetype)initWithAdjacencyMatrix:(nonnull NSArray<NSArray<NSNumber *> *> *)matrix;
- (void)run;

// temporary
- (NSArray<NSNumber *> * _Nonnull)dijkstra;

@end
