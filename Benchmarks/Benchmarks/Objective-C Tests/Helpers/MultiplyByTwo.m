//
// Created by Karol on 05/10/2018.
// Copyright (c) 2018 Karol Wieczorek. All rights reserved.
//

#import "MultiplyByTwo.h"

@interface MultiplyByTwo ()

@property (nonatomic, assign) int n;

@end


@implementation MultiplyByTwo

- (instancetype)initWithN:(int)n {
    self = [super init];
    if (self != nil) {
        self.n = n;
    }
    return self;
}

- (int)multiply {
    return 2 * self.n;
}

@end