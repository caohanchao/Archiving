//
//  NSObject+Archiving.h
//  Demo_Archiving
//
//  Created by caohanchao on 2017/7/3.
//  Copyright © 2017年 chc. All rights reserved.
//

/*
 归档 <---> 解档
 加载头文件即可以实现归解档
 这里需注意的是，基础数据类型属性需要用OC对象定义：如NSString,NSNumber;
 */
#import <Foundation/Foundation.h>


@interface NSObject (Archiving) <NSCoding>

@end
