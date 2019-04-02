//
//  ViewController.h
//  JSON
//
//  Created by Allen on 2018/12/18.
//  Copyright © 2018 Allen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *tvParseResult;

- (IBAction)onParseJson:(id)sender;

@end

