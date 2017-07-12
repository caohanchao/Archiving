//
//  NSObject+Archiving.m
//  Demo_Archiving
//
//  Created by caohanchao on 2017/7/3.
//  Copyright © 2017年 chc. All rights reserved.
//



#import "NSObject+Archiving.h"
#import <objc/runtime.h>

@implementation NSObject (Archiving)


+ (NSDictionary *)propertyOfSelf{
    // 1. 获得类中的所有成员变量
    // Ivar：成员属性的意思
    // 第一个参数：表示获取哪个类中的成员属性
    // 第二个参数：表示这个类有多少成员属性，传入一个Int变量地址，会自动给这个变量赋值
    // 返回值Ivar *：指的是一个ivar数组，会把所有成员属性放在一个数组中，通过返回的数组就能全部获取到
    
    unsigned int propertyCount = 0;
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    objc_property_t *properties = class_copyPropertyList(self, &propertyCount);
    
    for (unsigned int i = 0; i < propertyCount; ++i) {
        objc_property_t property = properties[i];
        const char * name = property_getName(property);//获取属性名字
        NSString *nameStr = [NSString stringWithUTF8String:name];
        
        const char * attributes = property_getAttributes(property);//获取属性类型
        NSString *attributesStr = [NSString stringWithUTF8String:attributes];
        
        NSArray *attributesArr = [attributesStr componentsSeparatedByString:@","];
        NSString *type = [attributesArr firstObject];
        type = [type stringByReplacingOccurrencesOfString:@"T" withString:@""];
        type = [type stringByReplacingOccurrencesOfString:@"\"" withString:@""];
        type = [type stringByReplacingOccurrencesOfString:@"@" withString:@""];
        NSLog(@"type:%@",type);
        
        dict[nameStr] = type;
    }
    return dict;
}

#pragma mark --- NSCoding方法
//归档(编码)
- (void)encodeWithCoder:(NSCoder *)aCoder {
    //对自定义类属性分别进行编码操作
    NSLog(@"开始对属性进行编码");
    NSDictionary *properNames = [[self class] propertyOfSelf];
    
    for (NSString *propertyName in properNames) {
        
        //通过KVC取出对应属性的值
        id value = [self valueForKey:propertyName];
        
        [aCoder encodeObject:value forKey:propertyName];
        
    }
}

//解档(解码)
- (instancetype )initWithCoder:(NSCoder *)aDecoder {
    NSLog(@"对自定义类的属性进行解码");
    
    NSDictionary *properNames = [[self class] propertyOfSelf];
    
    for (NSString *propertyName in properNames) {
        
        id value = [aDecoder decodeObjectForKey:propertyName];
        
        [self setValue:value forKey:propertyName];
        
    }
    return  self;
}


@end
