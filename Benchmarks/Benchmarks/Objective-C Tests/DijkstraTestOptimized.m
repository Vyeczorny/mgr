//
// Created by Karol on 2018-12-09.
// Copyright (c) 2018 Karol Wieczorek. All rights reserved.
//

#import "DijkstraTestOptimized.h"
#import "PriorityQueueObjC.h"
#import "GraphElement.h"

#import "Benchmarks-Swift.h"

@interface DijkstraOptimizedTestObjC () <Test>

@property (nonatomic, assign) NSUInteger n;
@property (nonatomic, assign) NSUInteger *adjacency;

@end

@implementation DijkstraOptimizedTestObjC

- (nonnull instancetype)initWithN:(int)n {
    self = [super init];
    if (self != nil) {
        self.n = (NSUInteger) n;
        self.adjacency = [self generateMatrixWithSize:n];
    }
    return self;
}

- (nonnull instancetype)initWithAdjacencyMatrix:(NSArray<NSArray<NSNumber *> *> *)matrix {
    self = [super init];
    if (self != nil) {
        self.n = matrix.count;
        self.adjacency = [self convertObjCMatrixToCMatrix:matrix];
    }
    return self;
}

- (void)dealloc {
    free(self.adjacency);
}

- (void)run {
    [self dijkstra];
}

- (NSArray<NSNumber *> *)dijkstra {
    NSUInteger n = self.n;
    
    PriorityQueueObjC *queue = [PriorityQueueObjC new];
    NSMutableArray<GraphElement *> * nodes = [NSMutableArray new];

    for (NSUInteger i = 0; i < n; ++i) {
        [nodes addObject:[[GraphElement alloc]initWithNodeIndex:i distance:MAX_DISTANCE]];
    }

    nodes[0].distance = 0;
    nodes[0].alreadyComputed = YES;
    [queue insert: nodes[0]];

    GraphElement *minimumElement;
    GraphElement *currentlyComputedElement;

    while (![queue isEmpty]) {
        minimumElement = (GraphElement *)[queue removeMin];
        minimumElement.alreadyComputed = YES;

        NSUInteger *currentRow = self.adjacency + (n * minimumElement.nodeIndex);

        for (NSUInteger index = 0; index < n; ++index) {
            if (currentRow[index] == 0) {
                // Vertices are not adjacent
                continue;
            }

            currentlyComputedElement = nodes[index];

            if (currentlyComputedElement.alreadyComputed) {
                continue;
            }

            NSUInteger minElementDistance = minimumElement.distance;
            NSUInteger elementNodeIndex = currentlyComputedElement.nodeIndex;
            NSUInteger elementDistance = currentRow[elementNodeIndex];

            NSUInteger relaxedDistance = minElementDistance + elementDistance;

            if (currentlyComputedElement.queueIndex == EMPTY_INDEX) {
                [queue insert:currentlyComputedElement];
            }

            if (relaxedDistance < currentlyComputedElement.distance) {
                currentlyComputedElement.distance = relaxedDistance;
                [queue updateDecreasedElement:currentlyComputedElement.queueIndex];
            }
        }
    }

    NSMutableArray<NSNumber *> *distances = [NSMutableArray new];
    for (GraphElement *element in nodes) {
        [distances addObject:@(element.distance)];
    }

    return distances;
}

- (NSUInteger *)generateMatrixWithSize:(int)n {
    NSUInteger *adjacency = malloc(sizeof(NSUInteger) * n * n);

    for (NSUInteger x = 0; x < n; ++x) {
        for (NSUInteger y = 0; y < n; ++y) {
            adjacency[n * y + x] = 0;
        }
    }

    // Random weights
    for (NSUInteger x = 0; x < n; ++x) {
        for (NSUInteger y = 0; y < n; ++y) {
            if (arc4random() % 2 == 0) {
                adjacency[n * y + x] = arc4random() % 900 + 100;
                adjacency[n * x + y] = adjacency[n * y + x];
            }
        }
    }

    return adjacency;
}

- (NSUInteger *)convertObjCMatrixToCMatrix:(NSArray<NSArray<NSNumber *> *> *)matrix {
    NSUInteger n = matrix.count;
    NSUInteger *adjacency = malloc(sizeof(NSUInteger) * n * n);

    for (NSUInteger x = 0; x < n; ++x) {
        for (NSUInteger y = 0; y < n; ++y) {
            adjacency[n * y + x] = [matrix[y][x] unsignedIntegerValue];
        }
    }

    return adjacency;
}

@end
