//
//  Person.m
//  CopyAndMutableCopy
//
//  Created by sw on 2017/5/31.
//  Copyright © 2017年 sw. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)copyWithZone:(NSZone *)zone {
    Person *person = [[[self class] allocWithZone:zone] init];
    person.name = self.name;
    person.age = self.age;
    return person;
}

- (instancetype)mutableCopyWithZone:(NSZone *)zone {
    return [self copyWithZone:zone];
}

@end
