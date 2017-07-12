//
//  ViewController.m
//  Demo_Archiving
//
//  Created by caohanchao on 2017/7/3.
//  Copyright © 2017年 chc. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "ArchiveTools.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /*
        只需要在归档的自定义对象中倒入 NSObject+Archiving.h
        不需要在根据自定义对象的每个属性赋值
     
     */
    
    
    //归档
    /*
     这里简单的对自定义对象初始化
     */
    Person *person1 = [[Person alloc] initWithName:@"Jonny" withAge:@"19"];
    BOOL issuccess = [ArchiveTools encodingWithFileName:@"jonny" withObj:person1 withKey:@"Person"];
    if (issuccess) {
        NSLog(@"--------encoding success--------");
    }
    
    
    //解档
    Person *person2 = [ArchiveTools decodingWithFileName:@"jonny" withKey:@"Person"];
    NSLog(@"secon person name:%@, age:%@", person2.name, person2.age);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
