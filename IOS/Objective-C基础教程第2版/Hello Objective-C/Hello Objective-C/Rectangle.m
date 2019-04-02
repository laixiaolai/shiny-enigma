//
//  Rectangle.m
//  Hello Objective-C
//
//  Created by Allen on 2019/3/20.
//  Copyright © 2019 Allen. All rights reserved.
//

#import "Rectangle.h"

@implementation Rectangle
{
    XYPoint *origin;
}

-(void) setOrigin:(XYPoint *)pt
{
    origin = pt;
}

-(XYPoint *) origin
{
    return origin;
}

-(void) setWidth:(int)w andHeight:(int)h
{
    _width = w;
    _height = h;
}

-(int) area
{
    return _width * _height;
}

-(int) perimeter
{
    return (_width + _height) * 2;
}

@end
