//
// Created by Karol on 05.07.2018.
// Copyright (c) 2018 Karol Wieczorek. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Test;

@interface BubbleSortOptimizedTestObjC : NSObject  <Test>

- (nonnull instancetype)initWithN:(int)n;

@end