//
// Created by Karol on 29.05.2018.
// Copyright (c) 2018 Karol Wieczorek. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Test;

@interface BubbleSortTestObjC : NSObject <Test>

- (nonnull instancetype)initWithN:(int)n;

@end