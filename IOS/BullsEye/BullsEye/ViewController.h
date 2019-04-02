//
//  ViewController.h
//  BullsEye
//
//  Created by Allen on 2019/1/21.
//  Copyright © 2019 Allen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIAlertViewDelegate>
- (IBAction)starOver:(id)sender;
-(IBAction)showAlertView;
-(IBAction)slideMoved:(UISlider *)sender;
- (IBAction)showInfo:(id)sender;
@property (strong, nonatomic) IBOutlet UISlider *slider;
@property (strong, nonatomic) IBOutlet UILabel *targetLabel;
@property (strong, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) IBOutlet UILabel *roundLabel;

@end

