//
//  Person.m
//  Demo_Archiving
//
//  Created by caohanchao on 2017/7/3.
//  Copyright © 2017年 chc. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>
@implementation Person

- (id)initWithName:(NSString *)name withAge:(NSString *)age {
    if (self = [super init]) {
        //将传过来的名字和年龄赋值
        self.name = name;
        self.age = age;
        self.old = YES;
//        self.aaa = 11.1;
        self.stuArr = [NSArray arrayWithObjects:[[Student alloc] initWithName:name withClassName:@"111"],[[Student alloc] initWithName:@"222" withClassName:@"3333"], nil];
        
    }
    return self;
}
    
    

//#pragma mark --- NSCoding方法
////归档(编码)
//- (void)encodeWithCoder:(NSCoder *)aCoder {
//    //对自定义类属性分别进行编码操作
//    NSLog(@"开始对属性进行编码");
////    //name编码
////    [aCoder encodeObject:self.name forKey:@"name"];
////    //age编码
////    [aCoder encodeInteger:self.age forKey:@"age"];
////
////    [aCoder encodeObject:self.stuArr forKey:@"stuArr"];
//
//    NSArray *properNames = [[self class] propertyOfSelf];
//
//    for (NSString *propertyName in properNames) {
//        SEL getSel = NSSelectorFromString(propertyName);
//        [aCoder encodeObject:[self performSelector:getSel] forKey:propertyName];
//    }
//
//}
//
////解档(解码)
//- (id)initWithCoder:(NSCoder *)aDecoder {
//    NSLog(@"对自定义类的属性进行解码");
////    if (self = [super init]) {
////        //name解码
////        self.name = [aDecoder decodeObjectForKey:@"name"];
////        //age解码
////        self.age = [aDecoder decodeIntegerForKey:@"age"];
////
////        self.stuArr = [aDecoder decodeObjectForKey:@"stuArr"];
////    }
////    return self;
//    NSArray *properNames = [[self class] propertyOfSelf];
//    for (NSString *propertyName in properNames) {
//        // 创建指向属性的set方法
//        // 1.获取属性名的第一个字符，变为大写字母
//        NSString *firstCharater = [propertyName substringToIndex:1].uppercaseString;
//        // 2.替换掉属性名的第一个字符为大写字符，并拼接出set方法的方法名
//        NSString *setPropertyName = [NSString stringWithFormat:@"set%@%@:",firstCharater,[propertyName substringFromIndex:1]];
//        SEL setSel = NSSelectorFromString(setPropertyName);
//        [self performSelector:setSel withObject:[aDecoder decodeObjectForKey:propertyName]];
//    }
//    return  self;
//}











@end
