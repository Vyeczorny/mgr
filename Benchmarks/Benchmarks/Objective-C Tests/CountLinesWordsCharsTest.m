//
// Created by Karol Wieczorek on 2019-02-10.
// Copyright (c) 2019 Karol Wieczorek. All rights reserved.
//

#import "CountLinesWordsCharsTest.h"
#import "Benchmarks-Swift.h"

@interface CountLinesWordsCharsTestObjC ()

@property (nonatomic, strong) NSString *data;

@end


@implementation CountLinesWordsCharsTestObjC

- (nonnull instancetype)initWithN:(int)n {
    self = [super init];
    if (self != nil) {
        self.data = [self generateDataWithN:n];
    }
    return self;
}

-(void)run {
    NSUInteger length = self.data.length;
    unichar stringBuffer[length];
    [self.data getCharacters: stringBuffer];
    NSUInteger chars = length;
    NSUInteger words = 0;
    NSUInteger lines = 0;

    BOOL isInWord = NO;

    for (int i = 0; i < length; ++i) {
        unichar current = stringBuffer[i];
        if (current == '\n') {
            ++lines;
        }

        if (current != '\n' && current != '\t' && current != ' ') {
            isInWord = YES;
        } else if (isInWord) {
            ++words;
            isInWord = NO;
        }
    }
}

- (NSString *)generateDataWithN:(int)n {
    NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ\t\n ";

    NSMutableString *randomString = [NSMutableString new];

    for (int i = 0; i < n; i++) {
        [randomString appendFormat: @"%C", [letters characterAtIndex: arc4random() % [letters length]]];
    }
    return randomString;
}

@end