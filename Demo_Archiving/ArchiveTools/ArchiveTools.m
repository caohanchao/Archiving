//
//  ArchiveTools.m
//  Demo_Archiving
//
//  Created by caohanchao on 2017/7/3.
//  Copyright © 2017年 chc. All rights reserved.
//

#import "ArchiveTools.h"

@implementation ArchiveTools


+ (void)createFileDirectories {
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
        }
    }
}



+ (BOOL)encodingWithFileName:(NSString *)name withObj:(id)obj withKey:(NSString *)key{
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    
    NSString *archivePath = [documentsPath stringByAppendingPathComponent:@"ArchiveFile"];
    
    NSString *filePath = [archivePath stringByAppendingPathComponent:name];
    
    [self createFileDirectories];
    
    NSMutableData *data = [NSMutableData data];

    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];

    [archiver encodeObject:obj forKey:key];
    
    [archiver finishEncoding];
    
    BOOL issuccess = [data writeToFile:filePath atomically:YES];
    
    return issuccess;
}


+ (id)decodingWithFileName:(NSString *)name withKey:(NSString *)key {
    
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    
    NSString *archivePath = [documentsPath stringByAppendingPathComponent:@"ArchiveFile"];
    
    NSString *filePath = [archivePath stringByAppendingPathComponent:name];
    
    NSData *data = [NSData dataWithContentsOfFile:filePath];

    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];

    id obj = [unarchiver decodeObjectForKey:key];

    [unarchiver finishDecoding];
    
    return obj;

}


@end
