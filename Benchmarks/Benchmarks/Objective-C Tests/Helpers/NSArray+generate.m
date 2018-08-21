//
// Created by Karol on 21.08.2018.
// Copyright (c) 2018 Karol Wieczorek. All rights reserved.
//

#import "NSArray+generate.h"


@implementation NSArray (generate)

+ (NSArray *)generateArrayOfSize:(NSInteger)size {
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:size];
    for (int i = 0; i < size; ++i) {
        array[i] = @(arc4random());
    }
    return array;
}

@end