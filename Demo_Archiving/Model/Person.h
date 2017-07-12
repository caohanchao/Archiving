//
//  Person.h
//  Demo_Archiving
//
//  Created by caohanchao on 2017/7/3.
//  Copyright © 2017年 chc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
#import "NSObject+Archiving.h"
@interface Person : NSObject

//name
@property (nonatomic, copy) NSString *name;
//age
@property (nonatomic, assign) NSString * age;

@property (nonatomic, assign)BOOL old;

@property (nonatomic,strong)NSArray <Student *>*stuArr;
//初始化的方法
- (id)initWithName:(NSString *)name withAge:(NSString *)age;










@end
