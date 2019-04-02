//
//  Fraction.m
//  Hello Objective-C
//
//  Created by Allen on 2019/3/15.
//  Copyright © 2019 Allen. All rights reserved.
//

#import "Fraction.h"

@implementation Fraction
//{
//    int numerator;
//    int denominator;
//}

//@synthesize numerator, denominator;//也可以不用这行语句，可以加下划线 “_” 直接用 _numerator, _denominator

- (void) print
{
    NSLog(@"%i/%i",_numerator,_denominator);
}

- (void) setTo:(int)n over:(int)d
{
    _numerator = n;
    _denominator = d;
}

- (Fraction *) add:(Fraction *)f
{
    Fraction *result = [[Fraction alloc] init];
    //添加两个分数 a/b +c/d = ((a*d) + (b*c)) / (b*d)
    result.numerator = _numerator * f.denominator +_denominator *f.numerator;
    result.denominator = _denominator * f.denominator;
    
    [result reduce];
    return result;
}

- (void) reduce
{
    int u = _numerator, v = _denominator, temp;
    
    while (v != 0) {
        temp = u % v;
        u = v;
        v = temp;
    }
    
    _numerator /= u;
    _denominator /= u;
}



//- (void) setNumerator:(int)n
//{
//    numerator = n;
//}
//
//- (void) setDenominator:(int)d
//{
//    denominator = d;
//}
//
//- (int) numerator
//{
//    return numerator;
//}
//
//- (int) denominator
//{
//    return denominator;
//}

- (double) convertToNum
{
    if(_denominator != 0)
    {
        return (double)_numerator / _denominator;
    }
    else{
        return NAN;
    }
}


@end
