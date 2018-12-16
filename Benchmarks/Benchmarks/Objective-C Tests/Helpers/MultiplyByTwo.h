//
// Created by Karol on 05/10/2018.
// Copyright (c) 2018 Karol Wieczorek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MultiplyByTwoProtocol.h"


@interface MultiplyByTwo : NSObject <MultiplyByTwoProtocol>

- (nonnull instancetype)initWithN:(int)n;
- (int)multiply;

@end