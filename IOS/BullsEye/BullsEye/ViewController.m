//
//  ViewController.m
//  BullsEye
//
//  Created by Allen on 2019/1/21.
//  Copyright © 2019 Allen. All rights reserved.
//

#import "ViewController.h"
#import "AboutViewController.h"

@interface ViewController ()

@end

@implementation ViewController{
    int currentValue;
    int targetValue;
    int score;
    int round;
}
//如果不加这句可以用_slider
@synthesize slider;
@synthesize scoreLabel;
@synthesize roundLabel;
//
- (void)updateLabels{
    self.targetLabel.text = [NSString stringWithFormat:@"%d",targetValue];
    self.scoreLabel.text = [NSString stringWithFormat:@"%d",score];
    self.roundLabel.text = [NSString stringWithFormat:@"%d",round];
}
- (void)startNewRound{
    round+=1;
    targetValue = 1+(arc4random()%100);
    currentValue = 50;
    self.slider.value = currentValue;
}

- (void)startNewGame{
    score=0;
    round=0;
    [self startNewRound];
    
}
- (void)starOver:(id)sender{
    //添加过渡效果
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionFade;
    transition.duration = 1;
    transition.timingFunction  = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    [self startNewGame];
    
    [self updateLabels];
    
    [self.view.layer addAnimation:transition forKey:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self startNewGame];
    [self updateLabels];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)showAlertView{
    int difference=abs(targetValue-currentValue);
    int points=100-difference;
    NSString *title;
    if(difference==0){
        title=@"土豪，你太NB了！";
        points+=100;
    }
    else if (difference<5){
        if(difference==1){
            points+=50;
        }
        title=@"土豪太棒了，差一点！";
    }
    else if (difference<10){
        title=@"好吧，勉强算个土豪！";
    }
    else{
        title=@"不是土豪少来装！";
    }
    
    score+=points;
    NSString *message = [NSString stringWithFormat:@"恭喜高富帅，您的得分是：%d",points];
    // 1.创建UIAlertController
//    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
//    // 2.创建并添加按钮
//    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        NSLog(@"OK Action");
//    }];
//    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
//        NSLog(@"Cancel Action");
//    }];
//
//    [alertController addAction:okAction];           // A
//    [alertController addAction:cancelAction];       // B
    
    // 3.呈现UIAlertContorller
//    [self presentViewController:alertController animated:YES completion:nil];
    [[[UIAlertView alloc]initWithTitle:title message:message delegate:self cancelButtonTitle:@"朕已知晓，爱卿⾟辛苦了" otherButtonTitles:nil, nil]show];
    
}

-(IBAction)slideMoved:(UISlider *)sender
{
    currentValue = lroundf(sender.value);
}

- (IBAction)showInfo:(id)sender {
    NSLog(@"123");
    AboutViewController *aboutViewController = [[AboutViewController alloc] initWithNibName:@"AboutViewController" bundle:nil];
    aboutViewController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:aboutViewController animated:YES completion:nil];
}

-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{
    [self startNewRound];
    [self updateLabels];
}

@end
