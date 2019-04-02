//
//  main.m
//  Hello Objective-C
//
//  Created by Allen on 2019/2/21.
//  Copyright © 2019 Allen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Fraction.h"
#import "Rectangle.h"
#import "Square.h"
#import "XYPoint.h"
#import "Complex.h"

@interface Calculator:NSObject

//累加方法
- (void) setAccumulator:(double) value;
- (void) clear;
- (double) accumulator;

//算术方法
- (void) add:(double) value;
- (void) subtract:(double) value;
- (void) multiply:(double) value;
- (void) divide:(double) value;

@end

@implementation Calculator
{
    double accumulator;
}

- (void) setAccumulator:(double)value
{
    accumulator = value;
}

- (void) clear
{
    accumulator = 0;
}

- (double) accumulator
{
    return accumulator;
}

- (void) add:(double)value
{
    accumulator += value;
}

- (void) subtract:(double)value
{
    accumulator -= value;
}

- (void) multiply:(double)value
{
    accumulator *= value;
}

- (void) divide:(double)value
{
    accumulator /= value;
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        Fraction *frac1 = [[Fraction alloc] init];
        Fraction *frac2 = [[Fraction alloc] init];
        Fraction *resultFraction;
        Complex *c1 = [[Complex alloc] init];
        Complex *c2 = [[Complex alloc] init];
        Complex *compResult;
        [frac1 setNumerator:1]; //等价于：frac1.numerator = 1;
        [frac1 setDenominator:5]; //等价于：frac1.denominator = 3;
        
        [frac2 setTo:2 over:5];
        resultFraction = [frac1 add:frac2];
        [resultFraction print];
        //[frac1 add:frac2];
        
        [c1 setReal:18.0 andImaginary:2.5];
        [c2 setReal:-5.0 andImaginary:3.2];
        compResult = [c1 add:c2];
        [compResult print];
        
        //NSLog(@"The value of frac1 is:%i/%i",[frac1 numerator],[frac1 denominator]);等价于下面这行代码;
        NSLog(@"The value of frac1 is:%i/%i",frac1.numerator,frac1.denominator);
        [frac1 print];
        NSLog(@"The value of frac2 is:%g",[frac2 convertToNum]);
        //[frac1 reduce];
        [frac1 print];
        
        int integerVer = 100;
        float floatingVar = 331.79;
        double doubleVar = 8.44e+11;
        char charVar = 'W';
        
        NSLog(@"integerVar = %i;\nfloatingVar = %f;\ndoubleVar = %e;\ndoubleVar = %g;\ncharVar = %c。",integerVer,floatingVar,doubleVar,doubleVar,charVar);
        
        Calculator *deskCalc = [[Calculator alloc] init];
        
        [deskCalc setAccumulator:100.0];
        [deskCalc add:200.];
        [deskCalc divide:15.0];
        [deskCalc subtract:10.0];
        [deskCalc multiply:5];
        NSLog(@"result = %g",[deskCalc accumulator]);
        
        char c,d;
        c = 'd';
        d = c;
        NSLog(@"d= %c",d);
        
        int n,m,num,count,sum;
        m=1;
        for(count=1;count<=2;count++)
        {
            NSLog(@"请输入num:");
            scanf("%i",&num);
            sum = 0;
            for(n=1;n<=num;n++)
            {
                sum+=n;
            }
            NSLog(@"sum = %i",sum);
        }
        while (m<5) {
            NSLog(@"m= %i",m);
            m++;
        }
        
        unsigned int u,v,temp;
        NSLog(@"输入两个数：");
        scanf("%u%u",&u,&v);
        while (v != 0) {
            temp = u % v;
            u = v;
            v = temp;
        }
        NSLog(@"最大公约数是%u",u);
        
        int number,right_digit,sums = 0;
        NSLog(@"输入数字:");
        scanf("%i",&number);
        while (number !=0 ) {
            right_digit = number % 10;
            NSLog(@"%i",right_digit);
            number /= 10;
        }
        do{
            right_digit = number % 10;
            sums = sums +right_digit;
            //NSLog(@"sums = %i",sums);
            number /= 10;
        }
        while (number != 0);
        
        NSLog(@"sums = %i",sums);
        
        //第八章--继承
        Rectangle *myRect = [[Rectangle alloc] init];
        XYPoint *myPoint = [[XYPoint alloc] init];
        [myPoint setX:100 andY:200];
        [myRect setWidth:3 andHeight:4];
        myRect.origin = myPoint;
        NSLog(@"myRect的宽是：%i,高是：%i",myRect.width,myRect.height);
        NSLog(@"myRect的周长是：%i",[myRect perimeter]);
        NSLog(@"myRect的面积是：%i",[myRect area]);
        NSLog(@"Origin at (%i, %i)",myRect.origin.x,myRect.origin.y);
        
        Square *mySquare = [[Square alloc] init];
        [mySquare setSide:5];
        NSLog(@"mySquare的宽是：%i,高是：%i",mySquare.width,mySquare.height);
        NSLog(@"mySquare的周长是：%i",[mySquare perimeter]);
        NSLog(@"mySquare的面积是：%i",[mySquare area]);
        
        
        
    }
    return (0);
}
