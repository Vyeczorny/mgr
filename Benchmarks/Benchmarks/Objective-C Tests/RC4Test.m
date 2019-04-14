//
// Created by Karol Wieczorek on 2019-02-16.
// Copyright (c) 2019 Karol Wieczorek. All rights reserved.
//

#import "RC4Test.h"
#import "Benchmarks-Swift.h"

@interface RC4TestObjC () <Test>

@property (nonatomic, assign) int dataLength;
@property (nonatomic, strong) NSString *data;
@property (nonatomic, strong) NSString *key;

@end

@implementation RC4TestObjC

- (instancetype)initWithN:(int)n {
    self = [super init];
    if (self != nil) {
        self.dataLength = n;
        self.data = [self generateStringOfSize:n];
        self.key = @"SecretKey";
    }
    return self;
}

- (void)run {
    u_int8_t* key = (u_int8_t *)[[self.key dataUsingEncoding:NSUTF8StringEncoding] bytes];
    u_int8_t* text = (u_int8_t *)[[self.data dataUsingEncoding:NSUTF8StringEncoding] bytes];

    u_int8_t* S = [self createSArrayWithKey:key keyLength:9];
    u_int8_t* ciphered = [self cipherText:text length:self.dataLength S:S];

    free(key);
    free(text);
    free(S);
    free(ciphered);
}


- (u_int8_t *)createSArrayWithKey:(u_int8_t *)key keyLength:(int)keyLength {
    u_int8_t * S = malloc(sizeof(u_int8_t) * 256);
    for (int i = 0; i < 256; ++i) {
        S[i] = (u_int8_t)i;
    }

    u_int8_t j = 0;
    for (int i = 0; i < 256; ++i) {
        j = j + S[i] + key[i % keyLength];
        [self swapInArray:S i:i j:j];
    }
    return S;
}

- (u_int8_t *)cipherText:(u_int8_t *)text length:(int)length S:(u_int8_t *)S {
    u_int8_t *output = malloc(sizeof(u_int8_t) * length);
    u_int8_t i = 0;
    u_int8_t j = 0;

    for (int k = 0; k < length; ++k) {
        i = (u_int8_t) (i + 1);
        j = (u_int8_t) (j + S[i]);
        [self swapInArray:S i:i j:j];

        u_int8_t x = S[(S[i] + S[j]) % 256];
        output[k] = text[k] ^ x;
    }

    return output;
}

- (void)swapInArray:(u_int8_t *)array i:(int)i j:(int)j {
    u_int8_t temp = array[i];
    array[i] = array[j];
    array[j] = temp;
}

- (void)printArray:(u_int8_t *)array length:(int)length {
    NSMutableString *string = [@"" mutableCopy];
    for (int i = 0; i < length; ++i) {
        [string appendString:[NSString stringWithFormat:@"%02X ", array[i]]];
    }
    NSLog(@"%@", string);
}

- (NSString *)generateStringOfSize:(int)n {
    NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ ";

    NSMutableString *randomString = [NSMutableString new];

    for (int i = 0; i < n; i++) {
        [randomString appendFormat: @"%C", [letters characterAtIndex: arc4random() % [letters length]]];
    }
    return randomString;
}

@end
