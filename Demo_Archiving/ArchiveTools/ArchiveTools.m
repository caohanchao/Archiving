//
//  ArchiveTools.m
//  Demo_Archiving
//
//  Created by caohanchao on 2017/7/3.
//  Copyright © 2017年 chc. All rights reserved.
//

#import "ArchiveTools.h"

@implementation ArchiveTools


+ (NSString *)createFileDirectories {
    // 判断文件夹是否存在，不存在则创建对应文件夹
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *archivePath = [documentsPath stringByAppendingPathComponent:@"ArchiveFile"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    BOOL isDir = FALSE;
    
    BOOL isDirExist = [fileManager fileExistsAtPath:archivePath isDirectory:&isDir];
    
    if(!(isDirExist && isDir)) {
        
        NSError *error;
        BOOL success1 = [fileManager createDirectoryAtPath:archivePath withIntermediateDirectories:YES attributes:nil error:&error];
        
        if(!success1){
            NSLog(@"Create ArchiveFile Directory Failed.");
        }else {
            NSLog(@"FileDirectories:%@",archivePath);
            return archivePath;
            
        }
    }
    return archivePath;
}



+ (BOOL)encodingWithFileName:(NSString *)name withObj:(id)obj withKey:(NSString *)key{
    
    NSString *filePath = [[self ArchiveFilePath] stringByAppendingPathComponent:name];
    
    NSMutableData *data = [NSMutableData data];
    
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    
    [archiver encodeObject:obj forKey:key];
    
    [archiver finishEncoding];
    
    BOOL issuccess = [data writeToFile:filePath atomically:YES];

    return issuccess;
}


+ (id)decodingWithFileName:(NSString *)name withKey:(NSString *)key {
    
    NSString *filePath = [[self ArchiveFilePath] stringByAppendingPathComponent:name];
    
    BOOL isFileExist = [[NSFileManager defaultManager] fileExistsAtPath:filePath];
    if (!isFileExist) {
        NSLog(@"不存在该文件");
        return nil;
    }
    
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    
    id obj = [unarchiver decodeObjectForKey:key];
    
    [unarchiver finishDecoding];
    
    return obj;

    
}

/*
 *在本地写入json文件
 */

/*--------------------------------------写入json文件--------------------------------------*/
+ (BOOL)writeJsonFileWithFileName:(NSString *)name withObj:(id)obj {
    
    NSError *parseError = nil;
    NSString *content = [ModelToJsonTools getJSONStrWithObj:obj options:0 error:&parseError];
    BOOL success = [content writeToFile:[NSString stringWithFormat:@"%@/\%@.json" ,[ArchiveTools ArchiveFilePath],name] atomically:YES encoding:NSUTF8StringEncoding error:nil];
    
    return success;
}

/*--------------------------------------读取json文件--------------------------------------*/
+ (id)readJsonFileWithFileName:(NSString *)name {
    
    NSString *filePath = [ [ArchiveTools ArchiveFilePath] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.json",name]];
    
    BOOL isFileExist = [[NSFileManager defaultManager] fileExistsAtPath:filePath];
    if (!isFileExist) {
        NSLog(@"不存在该文件");
       return nil;
    }
    NSData *data=[NSData dataWithContentsOfFile:filePath];
    
    id obj = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    return obj;
    
    
}




+ (NSString *)ArchiveFilePath {

    NSString *archivePath = [self createFileDirectories];
    
    return archivePath;
}

+ (BOOL)removeFileWithPath {

    NSString *archivePath = [self createFileDirectories];
    BOOL success = [[NSFileManager defaultManager] removeItemAtPath:archivePath error:nil];
    return success;
}

@end


#import <objc/runtime.h>

@implementation ModelToJsonTools

+ (NSDictionary *)dictionaryFromObject:(id)obj {
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    unsigned int propsCount;
    objc_property_t *props = class_copyPropertyList([obj class], &propsCount);
    for(int i = 0;i < propsCount; i++)
    {
        objc_property_t prop = props[i];
        
        NSString *propName = [NSString stringWithUTF8String:property_getName(prop)];
        id value = [obj valueForKey:propName];
        if(value == nil)
        {
            value = [NSNull null];
        }
        else
        {
            value = [self getObjectInternal:value];
        }
        [dic setObject:value forKey:propName];
    }
    return dic;
}

+ (NSString *)getJSONStrWithObj:(id)obj options:(NSJSONWritingOptions)options error:(NSError**)error {
    NSData *data = [NSJSONSerialization dataWithJSONObject:[self dictionaryFromObject:obj] options:options error:error];
    NSString *jsonstr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return jsonstr;
}

+ (id)getObjectInternal:(id)obj
{
    if([obj isKindOfClass:[NSString class]]
       || [obj isKindOfClass:[NSNumber class]]
       || [obj isKindOfClass:[NSNull class]])
    {
        return obj;
    }
    
    if([obj isKindOfClass:[NSArray class]])
    {
        NSArray *objarr = obj;
        NSMutableArray *arr = [NSMutableArray arrayWithCapacity:objarr.count];
        for(int i = 0;i < objarr.count; i++)
        {
            [arr setObject:[self getObjectInternal:[objarr objectAtIndex:i]] atIndexedSubscript:i];
        }
        return arr;
    }
    
    if([obj isKindOfClass:[NSDictionary class]])
    {
        NSDictionary *objdic = obj;
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:[objdic count]];
        for(NSString *key in objdic.allKeys)
        {
            [dic setObject:[self getObjectInternal:[objdic objectForKey:key]] forKey:key];
        }
        return dic;
    }
    return [self dictionaryFromObject:obj];
}

@end
