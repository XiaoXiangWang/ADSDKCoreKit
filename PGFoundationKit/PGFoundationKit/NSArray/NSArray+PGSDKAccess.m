//
//  NSArray+PGSDKAccess.m
//  PGFoundationKit
//
//  Created by 汪潇翔 on 15/4/30.
//  Copyright (c) 2015年 PGSDK. All rights reserved.
//

#import "NSArray+PGSDKAccess.h"

NSException* PGSDKaccessException(NSString* reason,Class class,id object){
    return [NSException exceptionWithName:NSObjectNotAvailableException
                                   reason:reason
                                 userInfo:@{@"Class":NSStringFromClass(class),
                                            @"Object":object}];
}

@implementation NSArray (PGSDKAccessClass)
-(id)PGSDK_objectAtIndex:(NSUInteger)index{
    id obj = nil;
    @try {
        obj = [self objectAtIndex:index];
    }
    @catch (NSException *exception) {
        NSLog(@"[%s,%s,%zi],Exception:%@",__FILE__,__FUNCTION__,__LINE__,exception);
    }
    @finally {
        return obj;
    }
}
-(id)PGSDK_objectAtIndex:(NSUInteger)index class:(Class)cla{
    id obj = [self PGSDK_objectAtIndex:index];
    //如果内容为空直接返回空
    if (obj) return nil;
    //比较Class
    if (![obj isKindOfClass:cla]) {
#if DEBUG
        NSString* reason = [NSString stringWithFormat:NSLocalizedString(@"你要访问的目标内容,并不是\"%@\"",nil),NSStringFromClass(cla)];
        @throw PGSDKaccessException(reason,((NSObject*)obj).class,obj);
#endif
        return nil;
    }
    return obj;
}

-(NSNumber*)PGSDK_numberAtIndex:(NSUInteger)index{
    return [self PGSDK_objectAtIndex:index class:[NSNumber class]];
}

-(NSString *)PGSDK_stringAtIndex:(NSUInteger)index{
    id string  = [self PGSDK_objectAtIndex:index];
    //如果返回内容为空
    if (string == nil) return nil;
    
    if (![string isKindOfClass:[NSString class]]) {
        if ([string respondsToSelector:@selector(stringValue)]) {
            string = [string stringValue];
        }else{
#if DEBUG
            @throw PGSDKaccessException(NSLocalizedString(@"你要访问的目标内容,并不是\"NSString\"", nil),((NSObject*)string).class,string);
#endif
            string = nil;
        }
    }
    return string;
}
-(NSArray *)PGSDK_arrayAtIndex:(NSUInteger)index{
    return [self PGSDK_objectAtIndex:index class:[NSArray class]];
}
-(NSDictionary*)PGSDK_dictionaryAtIndex:(NSUInteger)index{
    return [self PGSDK_objectAtIndex:index class:[NSDictionary class]];
}

-(NSValue*)PGSDK_valueAtIndex:(NSUInteger)index{
    return [self PGSDK_objectAtIndex:index class:[NSValue class]];
}

@end

@implementation NSArray (PGSDKAccessBaseType)

-(NSInteger)PGSDK_integerValueAtIndex:(NSUInteger)index{
    id object = [self PGSDK_objectAtIndex:index];
    //如果返回内容为空
    if (object == nil) return 0;
    
    if ([object respondsToSelector:@selector(integerValue)]) {
        return [object integerValue];
    }else{
#if DEBUG
        @throw PGSDKaccessException(NSLocalizedString(@"你要访问的目标内容,并不是\"NSInteger\"", nil),((NSObject*)object).class,object);
#endif
        return 0;
    }
}
-(NSUInteger)PGSDK_unsignedIntegerValueAtIndex:(NSUInteger)index{
    id object = [self PGSDK_objectAtIndex:index];
    //如果返回内容为空
    if (object == nil) return 0;
    
    if ([object respondsToSelector:@selector(unsignedIntegerValue)]) {
        return [object unsignedIntegerValue];
    }else{
#if DEBUG
        @throw PGSDKaccessException(NSLocalizedString(@"你要访问的目标内容,并不是\"NSUInteger\"", nil),((NSObject*)object).class,object);
#endif
        return 0;
    }
}


@end
