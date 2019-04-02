//
//  Square.m
//  Hello Objective-C
//
//  Created by Allen on 2019/3/20.
//  Copyright © 2019 Allen. All rights reserved.
//

#import "Square.h"

@implementation Square
-(int)side
{
    return self.width;
}
-(void)setSide:(int)s
{
    [self setWidth:s andHeight:s];
}
@end
