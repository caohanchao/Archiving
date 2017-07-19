##Archiving

###自定义模型的归解档

使用说明:

```
1. 导入“NSObject+Archiving.h”在自定义模型中 。
2. 使用ArchiveTools中的两个方法：
/**
 归档操作
 @param name 文件名
 @param obj 归档对象
 @param key 归档秘钥
 */
+ (BOOL)encodingWithFileName:(NSString *)name withObj:(id)obj withKey:(NSString *)key;

/**
 解档操作
 @param name 文件名
 @param key 解档秘钥
 @return    返回解档对象
 */
+ (id)decodingWithFileName:(NSString *)name withKey:(NSString *)key;


```

###自定义模型以JSON串的形式写入文件中

```
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

```

Demo中有具体的case！如果觉得简单就给个赞👍咯！

 <https://github.com/caohanchao/Archiving.git>  
   
##### 本人联系方式：627203960@qq.com / caohanchao@gmail.com

