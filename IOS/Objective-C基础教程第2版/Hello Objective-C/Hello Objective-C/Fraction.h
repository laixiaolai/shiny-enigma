//
//  Fraction.h
//  Hello Objective-C
//
//  Created by Allen on 2019/3/15.
//  Copyright © 2019 Allen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Fraction : NSObject

@property int numerator, denominator;

- (void) print;
//- (void) setNumerator:(int) n;
//- (void) setDenominator: (int) d;
//- (int) numerator;
//- (int) denominator;
- (void) setTo: (int) n over: (int) d;
- (Fraction *) add: (Fraction *) f;
- (double) convertToNum;
- (void) reduce;

@end
