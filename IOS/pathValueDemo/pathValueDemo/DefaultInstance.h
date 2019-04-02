//
//  DefaultInstance.h
//  pathValueDemo
//
//  Created by Allen on 2018/12/14.
//  Copyright © 2018 Allen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DefaultInstance : NSObject
+(instancetype)shareInstance;
@property(nonatomic,strong) NSString *str;
@end
