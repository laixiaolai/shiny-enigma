//
//  XTAlertViewController.m
//  RuiTong
//
//  Created by 李昆 on 2018/7/17.
//  Copyright © 2018年 lk. All rights reserved.
//

#import "XTAlertViewController.h"




@interface XTAlertViewController ()<XTAlertDelegate>
@property(nonatomic ,strong) UILabel * titleLab;
@property(nonatomic ,strong) UILabel * contentLab;
@property(nonatomic ,strong) UIView * backView;
@property(nonatomic ,strong) NSMutableArray * actionArray;
@end

@implementation XTAlertViewController
+(instancetype)alertWithTitle:(NSString *)title andContent:(NSString *)content{

    return [[XTAlertViewController alloc] initWithTitle:title andContent:content];
}

-(instancetype)initWithTitle:(NSString *)title andContent:(NSString *)content{
    self = [super init];
    if(self){
        self.modalPresentationStyle=UIModalPresentationOverCurrentContext;
        self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        _alertTitle = title;
        _alertContent = content;
    }
    return self;
}


-(instancetype)init{
    self = [super init];
    if(self){
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    
    UIImageView * backImageView = [[UIImageView alloc] init];
    backImageView.backgroundColor = [UIColor blackColor];
    backImageView.alpha = 0.5;
    [self.view addSubview:backImageView];
    [backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.top.equalTo(self.view);
    }];
    
    
    self.backView = [[UIView alloc] init];
    self.backView.backgroundColor = [UIColor whiteColor];
    self.backView.layer.cornerRadius = 10;
    self.backView.layer.masksToBounds = YES;
    [self.view addSubview:self.backView];
    [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.centerY.equalTo(self.view.mas_centerY);
        make.height.greaterThanOrEqualTo(@200);
        make.width.equalTo(@(300));
    }];
    
    self.titleLab = [[UILabel alloc] init];
    self.titleLab.text = self.alertTitle;
    self.titleLab.font = [UIFont systemFontOfSize:15];
    self.titleLab.textAlignment = NSTextAlignmentCenter;
    [self.backView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backView.mas_left).offset(10);
        make.right.equalTo(self.backView.mas_right).offset(-10);
        make.top.equalTo(self.backView.mas_top).offset(15);
        make.height.equalTo(@15);
    }];
    
    UIView * line = [[UIView alloc] init];
    [self.backView addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.backView);
        make.top.equalTo(self.titleLab.mas_bottom).offset(10);
        make.height.equalTo(@0.5);
    }];
    
    self.contentLab = [[UILabel alloc] init];
    self.contentLab.numberOfLines = 0;
    self.contentLab.text = self.alertContent;
    self.contentLab.font = [UIFont systemFontOfSize:14];
    self.contentLab.textAlignment = NSTextAlignmentCenter;
    [self.backView addSubview:self.contentLab];
    [self.contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backView.mas_left).offset(10);
        make.right.equalTo(self.backView.mas_right).offset(-10);
        make.top.equalTo(self.titleLab.mas_bottom).offset(15);
        make.bottom.equalTo(self.backView.mas_bottom).offset(-50);
    }];
    
    UIView * line2 = [[UIView alloc] init];
    line2.backgroundColor = [UIColor colorWithHexString:@"#e5e5e5"];
    [self.backView addSubview:line2];
    [line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.backView);
        make.top.equalTo(self.contentLab.mas_bottom).offset(9);
        make.height.equalTo(@0.5);
    }];
    
    for (XTAlertViewItem * btn in self.actionArray) {
        [self.backView addSubview:btn];
    }
    
    [self.actionArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:10 leadSpacing:10 tailSpacing:10];
    [self.actionArray mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.backView.mas_bottom);
        make.top.equalTo(self.contentLab.mas_bottom).offset(10);
        make.height.equalTo(@40);
    }];

}

-(NSMutableArray *)actionArray{
    if(_actionArray == nil){
        _actionArray = [[NSMutableArray alloc] init];
    }
    return _actionArray;
}


-(void)addAction:(XTAlertAction *)action{
    XTAlertViewItem * item = [[XTAlertViewItem alloc] init];
    item.text = action.title;
    item.textColor = action.titleColor;
    item.handle = action.handle;
    item.delegate = self;
    [self.actionArray addObject:item];
}

-(void)clickItem{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}


-(void)dealloc{
    NSLog(@"shifang");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end


#pragma mark ============弹窗Action============
@implementation XTAlertAction
+(instancetype)actionWithTitle:(NSString *)title andTitleColor:(UIColor *)titleColor action:(XTAlertActionBlock)handel{
    return [[XTAlertAction alloc] initWithTitle:title andTitleColor:titleColor action:handel];
}

-(instancetype)initWithTitle:(NSString *)title andTitleColor:(UIColor *)titleColor action:(XTAlertActionBlock)handel{
    self = [super init];
    if(self){
        _title = title;
        _titleColor = titleColor;
        _handle = handel;
    }
    return self;
}


@end
#pragma mark ============弹窗Item============
@implementation XTAlertViewItem
-(instancetype)init{
    self = [super init];
    if(self){
        self.textAlignment = NSTextAlignmentCenter;
        self.userInteractionEnabled = YES;
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickAction)]];
    }
    return self;
}


-(void)clickAction{
    [self.delegate clickItem];
    if(self.handle){
        self.handle();
    }
}
@end
