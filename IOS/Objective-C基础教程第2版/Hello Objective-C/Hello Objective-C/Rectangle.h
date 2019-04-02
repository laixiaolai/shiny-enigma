//
//  Rectangle.h
//  Hello Objective-C
//
//  Created by Allen on 2019/3/20.
//  Copyright © 2019 Allen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class XYPoint;

@interface Rectangle : NSObject

@property int width, height;

-(XYPoint *) origin;
-(void) setOrigin:(XYPoint *)pt;
-(void) setWidth:(int)w andHeight:(int)h;
-(int) area;
-(int) perimeter;
@end
