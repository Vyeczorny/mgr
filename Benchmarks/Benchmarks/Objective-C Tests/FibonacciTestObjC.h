//
// Created by Karol on 28.03.2018.
// Copyright (c) 2018 Karol Wieczorek. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Test;

@interface FibonacciTestObjC : NSObject <Test>

- (nonnull instancetype)initWithN:(int)n;

@end