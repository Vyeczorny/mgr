//
// Created by Karol on 05/10/2018.
// Copyright (c) 2018 Karol Wieczorek. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Test;

@interface MessageDispatchTestObjC : NSObject <Test>

- (nonnull instancetype)initWithN:(int)n;

@end