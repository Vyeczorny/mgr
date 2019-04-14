//
// Created by Karol Wieczorek on 2019-02-16.
// Copyright (c) 2019 Karol Wieczorek. All rights reserved.
//

#import "WordFrequencyTest.h"
#import "Benchmarks-Swift.h"

@interface WordFrequencyTestObjC () <Test>

@property (nonatomic, strong) NSString *data;

@end


@implementation WordFrequencyTestObjC

- (instancetype)initWithN:(int)n {
    self = [super init];
    if (self != nil) {
        self.data = [self generateDataWithN:n];
    }
    return self;
}

- (void)run {
    NSMutableDictionary <NSString *, NSNumber *> *dict = [NSMutableDictionary new];
    NSArray<NSString *> *words = [self.data componentsSeparatedByString:@" "];

    for (NSUInteger i = 0; i < words.count; ++i) {
        dict[words[i]] = @(dict[words[i]].integerValue + 1);
    }
}

- (NSString *)generateDataWithN:(int)n {
    NSArray<NSString *> *const lorem = @[@"lorem", @"ipsum", @"dolor", @"sit", @"amet", @"consectetur", @"adipiscing",
            @"elit", @"proin", @"nibh", @"augue", @"suscipit", @"a", @"scelerisque", @"sed", @"lacinia", @"in", @"mi",
            @"cras", @"vel", @"lorem", @"etiam", @"pellentesque", @"aliquet", @"tellus", @"phasellus", @"pharetra",
            @"nulla", @"ac", @"diam", @"quisque", @"semper", @"justo", @"at", @"risus", @"donec", @"venenatis",
            @"turpis", @"vel", @"hendrerit", @"interdum", @"dui", @"ligula", @"ultricies", @"purus", @"sed", @"posuere",
            @"libero", @"dui", @"id", @"orci", @"nam", @"congue", @"pede", @"vitae", @"dapibus", @"aliquet", @"elit",
            @"magna", @"vulputate", @"arcu", @"vel", @"tempus", @"metus", @"leo", @"non", @"est", @"etiam", @"sit",
            @"amet", @"lectus", @"quis", @"est", @"congue", @"mollis", @"phasellus", @"congue", @"lacus", @"eget",
            @"neque", @"phasellus", @"ornare", @"ante", @"vitae", @"consectetuer", @"consequat", @"purus", @"sapien",
            @"ultricies", @"dolor", @"et", @"mollis", @"pede", @"metus", @"eget", @"nisi", @"praesent", @"sodales",
            @"velit", @"quis", @"augue", @"cras", @"suscipit", @"urna", @"at", @"aliquam", @"rhoncus", @"urna", @"quam",
            @"viverra", @"nisi", @"in", @"interdum", @"massa", @"nibh", @"nec", @"erat"
    ];

    NSMutableArray <NSString *> *words = [@[] mutableCopy];

    for (int i = 0; i < n; ++i) {
        [words addObject:lorem[arc4random() % lorem.count]];
    }

    return [words componentsJoinedByString:@" "];
}


@end
