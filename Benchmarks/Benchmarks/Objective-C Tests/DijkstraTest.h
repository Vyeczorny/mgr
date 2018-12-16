//
// Created by Karol on 2018-12-15.
// Copyright (c) 2018 Karol Wieczorek. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Test;

@interface DijkstraTestObjC : NSObject <Test>

- (nonnull instancetype)initWithN:(int)n;
- (nonnull instancetype)initWithAdjacencyMatrix:(NSArray<NSArray<NSNumber *> *> *)matrix;
- (void)run;

// temporary
- (NSArray<NSNumber *> * _Nonnull)dijkstra;

@end