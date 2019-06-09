//
// Created by Karol on 21.08.2018.
// Copyright (c) 2018 Karol Wieczorek. All rights reserved.
//

#import "BinarySearchTreeTest.h"
#import "BinarySearchTreeObjC.h"
#import "NSArray+generate.h"
#import "Benchmarks-Swift.h"

@interface BinarySearchTreeTestObjC () <Test>

@property (nonatomic, assign) int n;
@property (nonatomic, strong) BinarySearchTreeObjC *tree;

@end

@implementation BinarySearchTreeTestObjC

- (instancetype)initWithN:(int)n {
    self = [super init];
    if (self != nil) {
        self.n = n;
    }
    return self;
}

- (void)run {
    NSArray *elements = [NSArray generateArrayOfSize:self.n];
    BinarySearchTreeObjC *tree = [BinarySearchTreeObjC new];
    self.tree = tree;

    for (NSNumber *element in elements) {
        [tree addElement:[element integerValue]];
    }

//    [tree print];
}

@end
