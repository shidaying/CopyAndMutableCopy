//
//  Person.h
//  CopyAndMutableCopy
//
//  Created by sw on 2017/5/31.
//  Copyright © 2017年 sw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject <NSCopying>

@property (nonatomic, assign) NSUInteger age;
@property (nonatomic, copy) NSString *name;

@end
