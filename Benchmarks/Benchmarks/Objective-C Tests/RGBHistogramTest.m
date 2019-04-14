//
// Created by Karol Wieczorek on 2019-02-09.
// Copyright (c) 2019 Karol Wieczorek. All rights reserved.
//

#import "RGBHistogramTest.h"
#import "Benchmarks-Swift.h"

#define RGB_R 0
#define RGB_G 1
#define RGB_B 2

typedef NSArray<NSNumber *> Pixel;
typedef NSArray<Pixel *> RGBData;


@interface RGBHistogramTestObjC () <Test>

@property (nonatomic, assign) int n;
@property (nonatomic, strong) RGBData *data;

@end

@implementation RGBHistogramTestObjC

- (nonnull instancetype)initWithN:(int)n {
    self = [super init];
    if (self != nil) {
        self.n = n;
        self.data = [self generateDataForN:n];
    }
    return self;
}

- (void)run {

    NSMutableArray *RHistogram = [[NSMutableArray alloc] initWithCapacity:256];
    NSMutableArray *GHistogram = [[NSMutableArray alloc] initWithCapacity:256];
    NSMutableArray *BHistogram = [[NSMutableArray alloc] initWithCapacity:256];
    for (NSUInteger i = 0; i < 256; ++i) {
        RHistogram[i] = @(0);
        GHistogram[i] = @(0);
        BHistogram[i] = @(0);
    }

    for (NSUInteger i = 0; i < self.data.count; ++i) {
        Pixel *element = self.data[i];
        NSUInteger rIndex = [element[RGB_R] unsignedIntegerValue];
        NSUInteger gIndex = [element[RGB_G] unsignedIntegerValue];
        NSUInteger bIndex = [element[RGB_B] unsignedIntegerValue];

        RHistogram[rIndex] = @([RHistogram[rIndex] unsignedIntegerValue] + 1);
        GHistogram[gIndex] = @([GHistogram[gIndex] unsignedIntegerValue] + 1);
        BHistogram[bIndex] = @([BHistogram[bIndex] unsignedIntegerValue] + 1);
    }
}

-(RGBData *)generateDataForN:(int)n {
    NSMutableArray<Pixel *> *data = [NSMutableArray new];
    for (int i = 0; i < n; ++i) {
        [data addObject:@[@(arc4random() % 256), @(arc4random() % 256), @(arc4random() % 256)]];
    }
    return data;
}

@end
