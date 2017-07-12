//
//  Student.h
//  Demo_Archiving
//
//  Created by caohanchao on 2017/7/3.
//  Copyright © 2017年 chc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+Archiving.h"
@interface Student : NSObject
    
@property (nonatomic,copy)NSString *name;
    
@property (nonatomic,copy)NSString *className;
    
- (id)initWithName:(NSString *)name withClassName:(NSString *)className;
@end
