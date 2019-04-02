//
//  DefaultInstance.m
//  pathValueDemo
//
//  Created by Allen on 2018/12/14.
//  Copyright © 2018 Allen. All rights reserved.
//

#import "DefaultInstance.h"

@implementation DefaultInstance
//通过类方法创建单例对象
+(instancetype)shareInstance{
    //静态变量
    static DefaultInstance *sharedVC = nil;
    if (sharedVC == nil) {
        sharedVC = [[DefaultInstance alloc]init];
    }
    return sharedVC;
}

@end
