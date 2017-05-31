//
//  ViewController.m
//  CopyAndMutableCopy
//
//  Created by sw on 2017/5/31.
//  Copyright © 2017年 sw. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import <objc/runtime.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self stringCopyAndMutableCopy];
    [self mutableStringCopyAndMutableCopy];
    [self arrayCopyAndMutableCopy];
    [self mutableArrayCopyAndMutableCopy];
    [self dictionaryCopyAndMutableCopy];
    [self mutableDictionaryCopyAndMutableCopy];
    [self customObjectCopyAndMutableCopy];
}

#pragma mark - String

- (void)stringCopyAndMutableCopy {
    NSString *originStr = @"123";
    NSString *copyStr = [originStr copy];//浅复制
    NSString *mutableCopyStr = [originStr mutableCopy];//深复制
    NSLog(@"string origin = %p, copy = %p, mutableCopy = %p", originStr, copyStr, mutableCopyStr);
    NSLog(@"str copy class = %s, mutableCopy class = %s", object_getClassName(copyStr), object_getClassName(mutableCopyStr));
}

- (void)mutableStringCopyAndMutableCopy {
    NSMutableString *originMutableStr = [NSMutableString stringWithString:@"123"];
    NSString *copyMutableStr = [originMutableStr copy];// 深复制
    NSString *mutableCopyMutableStr = [originMutableStr mutableCopy];//深复制
    NSLog(@"mutableStr origin = %p, copy = %p, mutableCopy = %p", originMutableStr, copyMutableStr, mutableCopyMutableStr);
    NSLog(@"mutableStr copy class = %s, mutableCopy class = %s", object_getClassName(copyMutableStr), object_getClassName(mutableCopyMutableStr));
}

#pragma mark - Array

/**
 *
 *  __NSArrayM->NSMutableArray->NSArray
 *  __NSArrayI->NSArray
 */


- (void)arrayCopyAndMutableCopy {
    NSArray *orginArray = @[@"123"];
    NSArray *copyArray = [orginArray copy];
    NSArray *mutableCopyArray = [orginArray mutableCopy];
    NSLog(@"array origin = %p, copy = %p, mutableCopy = %p", orginArray, copyArray, mutableCopyArray);
    NSLog(@"array copy class = %s, mutableCopy class = %s", object_getClassName(copyArray), object_getClassName(mutableCopyArray));
}

- (void)mutableArrayCopyAndMutableCopy {
    NSMutableArray *orginMutableArray = [NSMutableArray arrayWithObject:@"123"];
    NSArray *copyMutableArray = [orginMutableArray copy];
    NSArray *mutableCopyMutableArray = [orginMutableArray mutableCopy];
    NSLog(@"mutableArray origin = %p, copy = %p, mutableCopy = %p", orginMutableArray, copyMutableArray, mutableCopyMutableArray);
    NSLog(@"mutableArray copy class = %s, mutableCopy class = %s", object_getClassName(copyMutableArray), object_getClassName(mutableCopyMutableArray));
}

#pragma mark - Dictionary
/**
 *
 *  __NSDictionaryM->NSMutableDictionary->NSDictionary
 *  __NSDictionaryI->NSDictionary
 */
- (void)dictionaryCopyAndMutableCopy {
    NSDictionary *originDic = @{@"123":@"123"};
    NSArray *copyDic = [originDic copy];
    NSArray *mutableCopyDic = [originDic mutableCopy];
    NSLog(@"dic origin = %p, copy = %p, mutableCopy = %p", originDic, copyDic, mutableCopyDic);
    NSLog(@"dic copy class = %s, mutableCopy class = %s", object_getClassName(copyDic), object_getClassName(mutableCopyDic));
}



- (void)mutableDictionaryCopyAndMutableCopy {
    NSMutableDictionary *originMutableDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"123", @"123", nil];
    NSArray *copyMutableDic = [originMutableDic copy];
    NSArray *mutableCopyMutableDic = [originMutableDic mutableCopy];
    NSLog(@"mutableDic origin = %p, copy = %p, mutableCopy = %p", originMutableDic, copyMutableDic, mutableCopyMutableDic);
    NSLog(@"mutableDic copy class = %s, mutableCopy class = %s", object_getClassName(copyMutableDic), object_getClassName(mutableCopyMutableDic));
}

#pragma mark - Custom

- (void)customObjectCopyAndMutableCopy {
    Person *originPerson = [[Person alloc] init];
    originPerson.age = 30;
    originPerson.name = @"shi";
    
    Person *copyPerson = [originPerson copy];
    Person *mutableCopyPerson = [originPerson mutableCopy];
    NSLog(@"custom class origin = %p, copy = %p, mutableCopy = %p", originPerson, copyPerson, mutableCopyPerson);
    NSLog(@"custom copy class = %s, mutableCopy class = %s", object_getClassName(copyPerson), object_getClassName(mutableCopyPerson));
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
