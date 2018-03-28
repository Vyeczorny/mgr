//
//  ArrayInsertionTest.m
//  Benchmarks
//
//  Created by Karol Wieczorek on 21.08.2017.
//  Copyright © 2017 Karol Wieczorek. All rights reserved.
//

#import "ArrayInsertionTest.h"
#import "Benchmarks-Swift.h"

@interface ArrayInsertionTestObjC ()

@property (nonatomic, assign) int numberOfInsertions;

@end

@implementation ArrayInsertionTestObjC

- (instancetype)initWithNumberOfInsertions:(int)numberOfInsertions {
    self = [super init];
    if (self != nil) {
        self.numberOfInsertions = numberOfInsertions;
    }
    return self;
}

- (void)run {
    NSMutableArray *array = [NSMutableArray new];

    for (int i = 0; i < self.numberOfInsertions; ++i) {
        [array addObject:@(i)];
    }
}

@end
