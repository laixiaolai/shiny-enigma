//
//  Complex.m
//  Hello Objective-C
//
//  Created by Allen on 2019/3/22.
//  Copyright © 2019 Allen. All rights reserved.
//

#import "Complex.h"

@implementation Complex

-(void) print
{
    NSLog(@" %g + %gi",_real,_imaginary);
}

-(void) setReal:(double)a andImaginary:(double)b
{
    _real = a;
    _imaginary = b;
}

-(Complex *) add:(Complex *)f
{
    Complex *result = [[Complex alloc] init];
    result.real = _real + f.real;
    result.imaginary = _imaginary + f.imaginary;
    return result;
}

@end
