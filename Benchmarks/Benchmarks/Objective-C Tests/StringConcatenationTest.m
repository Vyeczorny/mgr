//
// Created by Karol Wieczorek on 2019-02-13.
// Copyright (c) 2019 Karol Wieczorek. All rights reserved.
//

#import "StringConcatenationTest.h"
#import "Benchmarks-Swift.h"

@interface StringConcatenationTestObjC ()

@property (nonatomic, assign) int n;

@end


@implementation StringConcatenationTestObjC

- (nonnull instancetype)initWithN:(int)n {
    self = [super init];
    if (self != nil) {
        self.n = n;
    }
    return self;
}

- (void)run {
    NSString *hello = @"Hello world\n";
    NSMutableString *string = [@"" mutableCopy];

    for (int i = 0; i < self.n; ++i) {
        [string appendString:hello];
    }
}

@end