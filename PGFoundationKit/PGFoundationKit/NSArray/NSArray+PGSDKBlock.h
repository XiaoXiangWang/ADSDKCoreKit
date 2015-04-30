//
//  NSArray+PGSDKBlock.h
//  PGFoundationKit
//
//  Created by 汪潇翔 on 15/4/30.
//  Copyright (c) 2015年 PGSDK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (PGSDKBlock)
-(void)PGSDK_enumerateObjectsUsingBlock:(void (^)(id object))block;
-(NSArray*)PGSDK_subarrayUsingBlock:(BOOL (^)(id object,BOOL* stop))block;
-(NSArray*)PGSDK_arrayUsingBlock:(id (^)(id object,BOOL* stop))block;

@end
