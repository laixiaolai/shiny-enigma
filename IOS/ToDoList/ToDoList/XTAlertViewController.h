//
//  XTAlertViewController.h
//  RuiTong
//
//  Created by 李昆 on 2018/7/17.
//  Copyright © 2018年 lk. All rights reserved.
//

#import <UIKit/UIKit.h>



/**
 通用弹窗控制器
 */
@class XTAlertAction,XTAlertViewItem;


@interface XTAlertViewController : UIViewController
@property (nonatomic ,copy) NSString * alertTitle;
@property (nonatomic ,copy) NSString * alertContent;

+(instancetype)alertWithTitle:(NSString *)title andContent:(NSString *)content;

-(void)addAction:(XTAlertAction *)action;


@end




typedef void(^XTAlertActionBlock)(void);

/**
 弹窗事件
 */
@interface XTAlertAction : NSObject

+(instancetype)actionWithTitle:(NSString *)title andTitleColor:(UIColor *)titleColor action:(XTAlertActionBlock) handel;

//-(instancetype)initWithTitle:(NSString *)title andTitleColor:(UIColor *)titleColor action:(XTAlertActionBlock) handel;


@property (nonatomic ,copy ,readonly)  NSString * title;
@property (nonatomic ,strong ,readonly) UIColor * titleColor;
@property (nonatomic ,copy)XTAlertActionBlock handle;
@end






@protocol XTAlertDelegate

-(void)clickItem;

@end

/**
 弹窗Item
 */
@interface XTAlertViewItem : UILabel

@property (nonatomic ,copy)XTAlertActionBlock handle;

@property (nonatomic ,weak) id<XTAlertDelegate> delegate;
@end
