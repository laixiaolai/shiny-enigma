//
//  Complex.h
//  Hello Objective-C
//
//  Created by Allen on 2019/3/22.
//  Copyright © 2019 Allen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Complex : NSObject

@property double real, imaginary;
-(void) print;
-(void) setReal:(double) a andImaginary:(double) b;
-(Complex *) add:(Complex *) f;

@end
