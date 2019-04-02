//
//  NextViewController.h
//  pathValueDemo
//
//  Created by Allen on 2018/12/13.
//  Copyright © 2018 Allen. All rights reserved.
//

#import <UIKit/UIKit.h>

//委托方-创建一个协议
@protocol passValueDelegate <NSObject>

//协议定义一个传值的方法
- (void)passValue:(NSString *)str;

@end

@interface NextViewController : UIViewController

//定义一个字符串属性
@property (nonatomic,strong) NSString *str;

//定义一个持有协议的id指针
@property (weak)id<passValueDelegate>delegate;

//定义一个block进行页面反向传值
@property (copy) void (^block)(NSString *);

@end
