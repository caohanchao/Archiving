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

Demo中有具体的case！如果觉得简单就给个赞👍咯！

 <https://github.com/caohanchao/Archiving.git>  
   
##### 本人联系方式：627203960@qq.com / caohanchao@gmail.com

