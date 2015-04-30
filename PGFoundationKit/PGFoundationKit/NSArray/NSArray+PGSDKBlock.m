//
//  NSArray+PGSDKBlock.m
//  PGFoundationKit
//
//  Created by 汪潇翔 on 15/4/30.
//  Copyright (c) 2015年 PGSDK. All rights reserved.
//

#import "NSArray+PGSDKBlock.h"

@implementation NSArray (PGSDKBlock)
-(void)PGSDK_enumerateObjectsUsingBlock:(void (^)(id))block{
    for (id obj in self) {
        block(obj);
    }
}


-(NSArray*)PGSDK_subarrayUsingBlock:(BOOL (^)(id, BOOL *))block{
    NSMutableArray* subArray = [NSMutableArray new];
    BOOL* stop = NO;
    for (id obj in self) {
        if (block(obj,stop)) {
            [subArray addObject:obj];
        }
        if (*stop) break;
    }
    return subArray;
}

-(NSArray *)PGSDK_arrayUsingBlock:(id (^)(id, BOOL *))block{
    NSMutableArray* array = [NSMutableArray new];
    BOOL* stop = NO;
    for (id obj in self) {
        [array addObject:block(obj,stop)];
        if (*stop) break;
    }
    return array;
}
@end
