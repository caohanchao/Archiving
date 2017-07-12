//
//  ArchiveTools.h
//  Demo_Archiving
//
//  Created by caohanchao on 2017/7/3.
//  Copyright © 2017年 chc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArchiveTools : NSObject

/*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-* 归档工具 *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*/

/**
 归档操作

 @param name 文件名
 @param obj 归档对象
 @param key 归档秘钥
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


@end
