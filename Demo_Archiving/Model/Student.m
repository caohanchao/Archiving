//
//  Student.m
//  Demo_Archiving
//
//  Created by caohanchao on 2017/7/3.
//  Copyright © 2017年 chc. All rights reserved.
//

#import "Student.h"

@implementation Student
    
- (id)initWithName:(NSString *)name withClassName:(NSString *)className {
    if (self = [super init]) {
        //将传过来的名字和年龄赋值
        self.name = name;
        self.className = className;
    }
    return self;
}
    
//- (void)encodeWithCoder:(NSCoder *)aCoder {
//
//    [aCoder encodeObject:self.name forKey:@"name"];
//
//    [aCoder encodeObject:self.className forKey:@"className"];
//}
//
//-(instancetype)initWithCoder:(NSCoder *)aDecoder{
//    if (self = [super init]) {
//        //name解码
//        self.name = [aDecoder decodeObjectForKey:@"name"];
//        //age解码
//        self.className = [aDecoder decodeObjectForKey:@"className"];
//    }
//    return self;
//}
//
@end
