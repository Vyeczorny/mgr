//
// Created by Karol on 2018-12-15.
// Copyright (c) 2018 Karol Wieczorek. All rights reserved.
//

#import "DijkstraTest.h"
#import "PriorityQueueObjC.h"
#import "GraphElement.h"

#import "Benchmarks-Swift.h"

@interface DijkstraTestObjC () <Test>

@property (nonatomic, assign) NSUInteger n;
@property (nonatomic, strong) NSArray<NSArray<NSNumber *> *> * adjacencyMatrix;

@end

@implementation DijkstraTestObjC

- (nonnull instancetype)initWithN:(int)n {
    self = [super init];
    if (self != nil) {
        self.n = (NSUInteger) n;
        self.adjacencyMatrix = [self generateMatrixWithSize:n];
    }
    return self;
}

- (nonnull instancetype)initWithAdjacencyMatrix:(NSArray<NSArray<NSNumber *> *> *)matrix {
    self = [super init];
    if (self != nil) {
        self.n = matrix.count;
        self.adjacencyMatrix = matrix;
    }
    return self;
}

- (void)run {
    [self dijkstra];
}

- (NSArray<NSNumber *> *)dijkstra {
    PriorityQueueObjC *queue = [PriorityQueueObjC new];
    NSMutableArray<GraphElement *> * nodes = [NSMutableArray new];

    for (NSUInteger i = 0; i < self.n; ++i) {
        [nodes addObject:[[GraphElement alloc]initWithNodeIndex:i distance:MAX_DISTANCE]];
    }

    nodes[0].distance = 0;
    nodes[0].alreadyComputed = YES;
    [queue insert: nodes[0]];

    while (![queue isEmpty]) {
        GraphElement *minimumElement = (GraphElement *)[queue removeMin];
        minimumElement.alreadyComputed = YES;

        for (NSNumber *index in [self adjacentNodesToNode:minimumElement.nodeIndex withMatrix:self.adjacencyMatrix n:self.n]) {
            GraphElement *element = nodes[[index unsignedIntegerValue]];

            if (element.alreadyComputed) {
                continue;
            }

            NSUInteger minElementDistance = minimumElement.distance;
            NSUInteger minElementNodeIndex = minimumElement.nodeIndex;
            NSUInteger elementNodeIndex = element.nodeIndex;
            NSUInteger elementDistance = [self.adjacencyMatrix[elementNodeIndex][minElementNodeIndex] unsignedIntegerValue];

            NSUInteger relaxedDistance = minElementDistance + elementDistance;

            if (element.queueIndex == EMPTY_INDEX) {
                [queue insert:element];
            }

            if (relaxedDistance < element.distance) {
                element.distance = relaxedDistance;
                [queue updateDecreasedElement:element.queueIndex];
            }
        }
    }

    NSMutableArray<NSNumber *> *distances = [NSMutableArray new];
    for (GraphElement *element in nodes) {
        [distances addObject:@(element.distance)];
    }

    return distances;
}

- (NSArray<NSNumber *> *)adjacentNodesToNode:(NSUInteger)index withMatrix:(NSArray<NSArray<NSNumber *> *> *)matrix n:(NSUInteger)n {
    NSMutableArray<NSNumber *> *adjacent = [NSMutableArray new];

    for (NSUInteger i = 0; i < n; ++i) {
        if ([matrix[index][i] unsignedIntegerValue] > 0) {
            [adjacent addObject:@(i)];
        }
    }
    return adjacent;
}

- (NSArray<NSArray<NSNumber *> *> *)generateMatrixWithSize:(int)n {
    NSMutableArray<NSMutableArray<NSNumber *> *> *adjacencyMatrix = [NSMutableArray new];
    for (NSUInteger x = 0; x < n; ++x) {
        NSMutableArray *row = [NSMutableArray new];
        for (NSUInteger y = 0; y < n; ++y) {
            [row addObject:@(0)];
        }
        [adjacencyMatrix addObject:row];
    }

    // Random weights
    for (NSUInteger x = 0; x < n; ++x) {
        for (NSUInteger y = 0; y < n; ++y) {
            if (arc4random() % 2 == 0) {
                adjacencyMatrix[x][y] = @(arc4random() % 900 + 100);
                adjacencyMatrix[y][x] = adjacencyMatrix[x][y];
            }
        }
    }

    return adjacencyMatrix;
}

@end
