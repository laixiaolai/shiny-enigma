//
//  ToDoItem.h
//  ToDoList
//
//  Created by Allen on 2018/11/20.
//  Copyright © 2018 Allen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDoItem : NSObject
@property NSString *itemName;
@property BOOL completed;
@property (readonly) NSDate *creationDate;
@end
