//
//  ViewController.m
//  pathValueDemo
//
//  Created by Allen on 2018/12/13.
//  Copyright © 2018 Allen. All rights reserved.
//

#import "ViewController.h"
#import "NextViewController.h"
#import "DefaultInstance.h"

@interface ViewController ()<passValueDelegate>//遵守协议

@property (nonatomic,strong) UILabel *label;
@property (nonatomic,strong) UIButton *btn;

@end

@implementation ViewController

-(UILabel *) label{
    if(_label==nil){
        _label=[[UILabel alloc]initWithFrame:CGRectMake(100, 100, 200, 40)];
        _label.backgroundColor=[UIColor blackColor];
        _label.textColor=[UIColor whiteColor];
        _label.font=[UIFont systemFontOfSize:20];
    }
    return _label;
}
-(UIButton *) btn{
    if(_btn==nil){
        _btn=[[UIButton alloc]initWithFrame:CGRectMake(100, 300, 200, 40)];
        _btn.backgroundColor=[UIColor redColor];
        [_btn setTitle:@"跳转至页面2" forState:UIControlStateNormal];
        [_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn;
}

//btn点击事件--跳转至页面2
- (void)btnClick{
    NextViewController *nextVC=[[NextViewController alloc]init];
    
    //属性传值--赋值传递
    //nextVC.str=@"属性传值";
    
    //单例传值-正向传递
    //[DefaultInstance shareInstance].str=@"单例传值";
    
    //NSUserDefaults传值--正向传值
    //[[NSUserDefaults standardUserDefaults] setObject:@"NSUserDefaults传值" forKey:@"NSUserDefaults"];//写入值
    //同步值
    //[[NSUserDefaults standardUserDefaults] synchronize];
    
    //代理传值--设置代理关系
    //nextVC.delegate=self;
    
    //block传值--实现block-接收来自页面2的值
    nextVC.block = ^(NSString *str){
        //self.label.text = str;
    };
    
    //通知传值--添加监听--等待页面2的传值
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notHandle:) name:@"notify" object:nil];
    
    [self presentViewController:nextVC animated:YES completion:nil];
}

//接收到通知之后的处理--参数1:通知
- (void)notHandle:(NSNotification*)not{
    self.label.text = not.userInfo[@"not"];
}

//页面将要显示的时候
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    //单例传值--接收页面2的反向传值
    //self.label.text=[DefaultInstance shareInstance].str;
    
    //NSUserDefaults传值--接收页面2的反向传值
    //self.label.text=[[NSUserDefaults standardUserDefaults] objectForKey:@"NSUserDefaults-re"];
    
}

//代理传值--实现协议方法--接收来自页面2的值
- (void)passValue:(NSString *)str{
    //self.label.text = str;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.label];
    [self.view addSubview:self.btn];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
