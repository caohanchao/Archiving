//
//  ArchiveTools.h
//  Demo_Archiving
//
//  Created by caohanchao on 2017/7/3.
//  Copyright © 2017年 chc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArchiveTools : NSObject

/** 工具类中包含 系统归档 以及 JSON存本地文件归档 两种方法 **/

/*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-* 归档工具 *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*/

/**
 归档操作

 @param name 文件名
 @param obj 归档对象
 @param key 归档秘钥
 @return    返回归档是否成功
 */
+ (BOOL)encodingWithFileName:(NSString *)name withObj:(id)obj withKey:(NSString *)key;

/*---------------------------------------分*割*线---------------------------------------*/



/*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-* 解档工具 *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*/

/**
 解档操作
 
 @param name 文件名
 @param key 解档秘钥
 @return    返回解档对象
 */
+ (id)decodingWithFileName:(NSString *)name withKey:(NSString *)key;

/*--------------------------------------分*割*线-----------------------------------------*/





/**
 写入json文件
 @param name 文件名
 @param obj  对象
 @return     写入成功或者失败
 */
+ (BOOL)writeJsonFileWithFileName:(NSString *)name withObj:(id)obj;


/**
 读取json文件
 @param name 文件名
 @return     读取json内容
 */
+ (id)readJsonFileWithFileName:(NSString *)name;


@end




@interface ModelToJsonTools : NSObject

/**
 对象转字典
 
 @param obj 对象
 @return 返回字典
 */
+ (NSDictionary *)dictionaryFromObject:(id)obj;


/**
 对象转json串
 
 @param obj 对象
 @param options NSJSONWritingOptions
 @param error 错误地址
 @return 返回json串
 */
+ (NSString *)getJSONStrWithObj:(id)obj options:(NSJSONWritingOptions)options error:(NSError**)error;


@end
