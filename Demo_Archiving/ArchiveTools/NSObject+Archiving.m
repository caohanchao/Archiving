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

//    NSLog(@"开始对属性进行编码");
    NSDictionary *properNames = [[self class] propertyOfSelf];
    
    for (NSString *propertyName in properNames) {
        

        id value = [self valueForKey:propertyName];
        
        [aCoder encodeObject:value forKey:propertyName];
        
    }
}

//解档(解码)
- (instancetype )initWithCoder:(NSCoder *)aDecoder {
//    NSLog(@"对自定义类的属性进行解码");
    NSDictionary *properNames = [[self class] propertyOfSelf];
    
    for (NSString *propertyName in properNames) {
        
        id value = [aDecoder decodeObjectForKey:propertyName];
        
        [self setValue:value forKey:propertyName];
        
    }
    return  self;
}


@end
