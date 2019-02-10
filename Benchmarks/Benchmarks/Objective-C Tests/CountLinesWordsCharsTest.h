//
// Created by Karol Wieczorek on 2019-02-10.
// Copyright (c) 2019 Karol Wieczorek. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Test;

@interface CountLinesWordsCharsTestObjC : NSObject <Test>

- (nonnull instancetype)initWithN:(int)n;

@end