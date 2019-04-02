//
//  ViewController.m
//  JSON
//
//  Created by Allen on 2018/12/18.
//  Copyright © 2018 Allen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)onParseJson:(id)sender {
    /* 第一部分
     IOS5+自带JSON操作库
     数据解析：
     要求：分别解析以下JSON数据
     1、{"name":"James","age":"30"}
     2、{"user":{"name":"James","age":"30"}}
     3、[{"name":"james"},{"name":"jim"}]
     4、{"user":[{"name":"james"},{"name":"jim"}]}
     目的：掌握通过NSJSONSerialization类解析JSON数据
     重点：掌握静态函数JSONObjectWithData: options: error:使用
     */
/*------第一部分s-----*/
    /*1、{"name":"James","age":"30"}*/
//    NSString *jsonStr = @"{\"name\":\"James\",\"age\":\"30\"}";
//    NSData *jsonData = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
//
//    id jsonObj = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:nil];
//    if([jsonObj isKindOfClass:[NSDictionary class]]){
//        //字典类型
//        NSDictionary *dic=(NSDictionary *)jsonObj;
//        _tvParseResult.text = [_tvParseResult.text stringByAppendingString:[dic objectForKey:@"name"]];
//        _tvParseResult.text = [_tvParseResult.text stringByAppendingString:@"\n"];
//        _tvParseResult.text = [_tvParseResult.text stringByAppendingString:[dic objectForKey:@"age"]];
//
//    }
//    if([jsonObj isKindOfClass:[NSArray class]])
//    {
//        //数组类型
//    }
    
    /*2、{"user":{"name":"James","age":"30"}}*/
//    NSString *jsonTreeStr = @"{\"user\":{\"name\":\"James\",\"age\":\"30\"}}";
//    NSData *jsonData = [jsonTreeStr dataUsingEncoding:NSUTF8StringEncoding];
//
//
//    id jsonObj = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:nil];
//    if([jsonObj isKindOfClass:[NSDictionary class]]){
//        //字典类型
//        NSDictionary *dic=(NSDictionary *)jsonObj;
//        NSDictionary *dic1 = [dic objectForKey:@"user"];
//
//
//        _tvParseResult.text = [_tvParseResult.text stringByAppendingString:[dic1 objectForKey:@"name"]];
//        _tvParseResult.text = [_tvParseResult.text stringByAppendingString:@"\n"];
//        _tvParseResult.text = [_tvParseResult.text stringByAppendingString:[dic1 objectForKey:@"age"]];
//
//    }
//    if([jsonObj isKindOfClass:[NSArray class]])
//    {
//        //数组类型
//    }
    
    /*3、[{"name":"james"},{"name":"jim"}]*/
//    NSString *jsonArrStr = @"[{\"name\":\"James\"},{\"name\":\"jim\"}]";
//    NSData *jsonData = [jsonArrStr dataUsingEncoding:NSUTF8StringEncoding];
//
//
//    id jsonObj = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:nil];
//    if([jsonObj isKindOfClass:[NSDictionary class]]){
//        //字典类型
//        NSDictionary *dic=(NSDictionary *)jsonObj;
//        NSDictionary *dic1 = [dic objectForKey:@"user"];
//
//        _tvParseResult.text = [_tvParseResult.text stringByAppendingString:[dic1 objectForKey:@"name"]];
//        _tvParseResult.text = [_tvParseResult.text stringByAppendingString:@"\n"];
//        _tvParseResult.text = [_tvParseResult.text stringByAppendingString:[dic1 objectForKey:@"age"]];
//
//    }
//    if([jsonObj isKindOfClass:[NSArray class]])
//    {
//        //数组类型
//        NSArray *arr = (NSArray *)jsonObj;
//
//        for (NSDictionary *dic in arr) {
//            _tvParseResult.text = [_tvParseResult.text stringByAppendingString:[dic objectForKey:@"name"]];
//            _tvParseResult.text = [_tvParseResult.text stringByAppendingString:@"\n"];
//        }
//    }
    
    /*4、{"user":[{"name":"james"},{"name":"jim"}]}*/
//    NSString *jsonTreeArrStr = @"{\"user\":[{\"name\":\"james\"},{\"name\":\"jim\"}]}";
//    NSData *jsonData = [jsonTreeArrStr dataUsingEncoding:NSUTF8StringEncoding];
//
//    //把字符串解析成对象
//    id jsonObj = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:nil];
//    if([jsonObj isKindOfClass:[NSDictionary class]]){
//        //字典类型
//        NSDictionary *dic=(NSDictionary *)jsonObj;
//        NSArray *arr = [dic objectForKey:@"user"];
//
//        for (NSDictionary *dic1 in arr) {
//            _tvParseResult.text = [_tvParseResult.text stringByAppendingString:[dic1 objectForKey:@"name"]];
//            _tvParseResult.text = [_tvParseResult.text stringByAppendingString:@"\n"];
//        }
//    }
//    if([jsonObj isKindOfClass:[NSArray class]])
//    {
//        //数组类型
//        NSArray *arr = (NSArray *)jsonObj;
//
//        for (NSDictionary *dic in arr) {
//            _tvParseResult.text = [_tvParseResult.text stringByAppendingString:[dic objectForKey:@"name"]];
//            _tvParseResult.text = [_tvParseResult.text stringByAppendingString:@"\n"];
//        }
//    }
/*------第一部分e-----*/
    /* 第二部分
     数据解析：
     要求：
     1、从文件读取json数据并解析，文件名称weatherinfo.json
     2、从网络读取json数据并解析，http://www.weather.com.cn/data/cityinfo/101010100.html
     目的：掌握通过NSJSONSerialization类解析来自文件和网络的JSON数据
     重点：掌握静态函数JSONObjectWithData: options: error:使用，灵活掌握json的数据读取技巧
     */
/*------第二部分s-----*/
    /*1、从文件读取json数据并解析，文件名称weatherinfo.json*/
//    NSString *jsonStr = nil;
//    //主目录 NSBundle mainBundle
//    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"weatherinfo" ofType:@"json"];
//    //判断是否存在路径filePath
//    NSFileManager *fileMgr = [NSFileManager defaultManager];
//
//    if([fileMgr fileExistsAtPath:filePath])
//    {
//        //读取文件内容
//        jsonStr = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
//    }
//    else{
//        _tvParseResult.text = @"文件没有找到";
//        return;
//    }
//
//    NSData *jsonData = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
//
//    //把字符串解析成对象
//    id jsonObj = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:nil];
//    if([jsonObj isKindOfClass:[NSDictionary class]]){
//        //字典类型
//        NSDictionary *dic=(NSDictionary *)jsonObj;
//        NSDictionary *dic1 = [dic objectForKey:@"weatherinfo"];
//
//        _tvParseResult.text = [_tvParseResult.text stringByAppendingString:[dic1 objectForKey:@"cityid"]];
//        _tvParseResult.text = [_tvParseResult.text stringByAppendingString:@"\n"];
//        _tvParseResult.text = [_tvParseResult.text stringByAppendingString:[dic1 objectForKey:@"city"]];
//        _tvParseResult.text = [_tvParseResult.text stringByAppendingString:@"\n"];
//
//    }
//    if([jsonObj isKindOfClass:[NSArray class]])
//    {
//        //数组类型
//        NSArray *arr = (NSArray *)jsonObj;
//
//        for (NSDictionary *dic in arr) {
//            _tvParseResult.text = [_tvParseResult.text stringByAppendingString:[dic objectForKey:@"name"]];
//            _tvParseResult.text = [_tvParseResult.text stringByAppendingString:@"\n"];
//        }
//    }

    /*2、从网络读取json数据并解析，http://www.weather.com.cn/data/cityinfo/101010100.html*/
    NSURL *url = [NSURL URLWithString:@"http://www.weather.com.cn/data/cityinfo/101010100.html"];
    
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    NSData *jsonData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    /*下面两行注释等同于上面两行代码效果*/
    //NSString *jsonStr = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    //NSData *jsonData = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
    /*下面这行注释的效果等同于上面两行代码效果*/
    //NSData *jsonData = [NSData dataWithContentsOfURL:url];
    

    //把字符串解析成对象
    id jsonObj = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:nil];
    if([jsonObj isKindOfClass:[NSDictionary class]]){
        //字典类型
        NSDictionary *dic=(NSDictionary *)jsonObj;
        NSDictionary *dic1 = [dic objectForKey:@"weatherinfo"];
        
        _tvParseResult.text = [_tvParseResult.text stringByAppendingString:[dic1 objectForKey:@"cityid"]];
        _tvParseResult.text = [_tvParseResult.text stringByAppendingString:@"\n"];
        _tvParseResult.text = [_tvParseResult.text stringByAppendingString:[dic1 objectForKey:@"city"]];
        _tvParseResult.text = [_tvParseResult.text stringByAppendingString:@"\n"];
        
    }
    if([jsonObj isKindOfClass:[NSArray class]])
    {
        //数组类型
        NSArray *arr = (NSArray *)jsonObj;
        
        for (NSDictionary *dic in arr) {
            _tvParseResult.text = [_tvParseResult.text stringByAppendingString:[dic objectForKey:@"name"]];
            _tvParseResult.text = [_tvParseResult.text stringByAppendingString:@"\n"];
        }
    }
    /*------第二部分e-----*/
    /* 第三部分
     数据解析：
     要求：使用JSONKit解析json数据，数据源：http://www.weather.com.cn/data/cityinfo/101010100.html
     
     目的：掌握使用JSONKit解析JSON数据
     重点：掌握集成JSONKit的方法。
        1、-fno-objc-arc指令的使用
        2、isa错误的修正
     */
    /*------第三部分s-----*/
    
    
}
@end
