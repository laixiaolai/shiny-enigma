//
//  NextViewController.m
//  pathValueDemo
//
//  Created by Allen on 2018/12/13.
//  Copyright © 2018 Allen. All rights reserved.
//

#import "NextViewController.h"
#import "DefaultInstance.h"

@interface NextViewController ()

@property (strong,nonatomic) UITextField *textField;
@property (strong,nonatomic) UIButton *btn;

@end

@implementation NextViewController

-(UITextField *)textField{
    if(!_textField){
        _textField=[[UITextField alloc]initWithFrame:CGRectMake(100, 100, 200, 40)];
        _textField.textColor=[UIColor blackColor];
        _textField.borderStyle=UITextBorderStyleLine;
        
        //属性传值--接收并显示
        //_textField.text=self.str;
        
        //单例传值--接收并显示
        //_textField.text=[DefaultInstance shareInstance].str;
        
        //NSUserDefaults传值--从文件中读取并显示
        //_textField.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"NSUserDefaults"];
        
    }
    return _textField;
}

-(UIButton *)btn{
    if(!_btn){
        _btn=[[UIButton alloc]initWithFrame:CGRectMake(100, 300, 200, 40)];
        _btn.backgroundColor=[UIColor redColor];
        [_btn setTitle:@"跳转回页面1" forState:UIControlStateNormal];
        [_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _btn.titleLabel.font=[UIFont systemFontOfSize:20];
        [_btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn;
}

//点击事件--回到页面1
-(void)btnClick{
    //单例传值--反向传递
    //[DefaultInstance shareInstance].str=self.textField.text;
    //NSUserDefaults传值--反向传值
    //[[NSUserDefaults standardUserDefaults] setObject:self.textField.text forKey:@"NSUserDefaults-re"];
    //[[NSUserDefaults standardUserDefaults] synchronize];
    
    //代理传值--反向传值
    //[self.delegate passValue:self.textField.text];
    
    //block传值--反向传值
    //self.block(self.textField.text);
    
    //通知传值--发送通知
    [[NSNotificationCenter defaultCenter] postNotificationName:@"notify" object:nil userInfo:@{@"not":self.textField.text}];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:self.textField];
    [self.view addSubview:self.btn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
