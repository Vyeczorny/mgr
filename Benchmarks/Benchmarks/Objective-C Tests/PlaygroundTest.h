//
// Created by Karol on 24.05.2018.
// Copyright (c) 2018 Karol Wieczorek. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Test;

@interface PlaygroundTestObjC : NSObject <Test>

- (nonnull instancetype)initWithN:(int)n;

@end