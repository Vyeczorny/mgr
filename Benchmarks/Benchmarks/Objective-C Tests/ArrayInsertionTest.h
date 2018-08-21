//
//  ArrayInsertionTest.h
//  Benchmarks
//
//  Created by Karol Wieczorek on 21.08.2017.
//  Copyright © 2017 Karol Wieczorek. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Test;

@interface ArrayInsertionTestObjC : NSObject <Test>

- (nonnull instancetype)initWithN:(int)n;

@end
