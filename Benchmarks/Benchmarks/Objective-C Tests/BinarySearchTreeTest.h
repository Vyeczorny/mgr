//
// Created by Karol on 21.08.2018.
// Copyright (c) 2018 Karol Wieczorek. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Test;

@interface BinarySearchTreeTestObjC : NSObject <Test>

- (nonnull instancetype)initWithN:(int)n;

@end