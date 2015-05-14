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

-(double)PGSDK_doubleValueAtIndex:(NSUInteger)index{
    id object = [self PGSDK_objectAtIndex:index];
    //如果返回内容为空
    if (object == nil) return 0;
    
    if ([object respondsToSelector:@selector(doubleValue)]) {
        return [object doubleValue];
    }else{
#if DEBUG
        @throw PGSDKaccessException(NSLocalizedString(@"你要访问的目标内容,并不是\"double\"", nil),((NSObject*)object).class,object);
#endif
        return 0;
    }
}

-(CGFloat)PGSDK_CGFloatAtIndex:(NSUInteger)index{
    return [self PGSDK_doubleValueAtIndex:index];
}

-(float)PGSDK_floatValueAtIndex:(NSUInteger)index{
    id object = [self PGSDK_objectAtIndex:index];
    //如果返回内容为空
    if (object == nil) return 0;
    
    if ([object respondsToSelector:@selector(floatValue)]) {
        return [object floatValue];
    }else{
#if DEBUG
        @throw PGSDKaccessException(NSLocalizedString(@"你要访问的目标内容,并不是\"float\"", nil),((NSObject*)object).class,object);
#endif
        return 0;
    }
}

-(BOOL)PGSDK_BOOLValueAtIndex:(NSUInteger)index{
    id object = [self PGSDK_objectAtIndex:index];
    //如果返回内容为空
    if (object == nil) return 0;
    
    if ([object respondsToSelector:@selector(boolValue)]) {
        return [object boolValue];
    }else{
#if DEBUG
        @throw PGSDKaccessException(NSLocalizedString(@"你要访问的目标内容,并不是\"bool\"", nil),((NSObject*)object).class,object);
#endif
        return 0;
    }
}

-(char)PGSDK_charValueAtIndex:(NSUInteger)index{
    id object = [self PGSDK_objectAtIndex:index];
    //如果返回内容为空
    if (object == nil) return 0;
    
    if ([object respondsToSelector:@selector(charValue)]) {
        return [object charValue];
    }else{
#if DEBUG
        @throw PGSDKaccessException(NSLocalizedString(@"你要访问的目标内容,并不是\"char\"", nil),((NSObject*)object).class,object);
#endif
        return 0;
    }
}

-(short)PGSDK_shortValueAtIndex:(NSUInteger)index{
    id object = [self PGSDK_objectAtIndex:index];
    //如果返回内容为空
    if (object == nil) return 0;
    
    if ([object respondsToSelector:@selector(shortValue)]) {
        return [object shortValue];
    }else{
#if DEBUG
        @throw PGSDKaccessException(NSLocalizedString(@"你要访问的目标内容,并不是\"short\"", nil),((NSObject*)object).class,object);
#endif
        return 0;
    }
}

-(long)PGSDK_longValueAtIndex:(NSUInteger)index{
    id object = [self PGSDK_objectAtIndex:index];
    //如果返回内容为空
    if (object == nil) return 0;
    
    if ([object respondsToSelector:@selector(longValue)]) {
        return [object longValue];
    }else{
#if DEBUG
        @throw PGSDKaccessException(NSLocalizedString(@"你要访问的目标内容,并不是\"long\"", nil),((NSObject*)object).class,object);
#endif
        return 0;
    }
}

-(unsigned long)PGSDK_unsignedLongValueAtIndex:(NSUInteger)index{
    id object = [self PGSDK_objectAtIndex:index];
    //如果返回内容为空
    if (object == nil) return 0;
    
    if ([object respondsToSelector:@selector(unsignedLongValue)]) {
        return [object unsignedLongValue];
    }else{
#if DEBUG
        @throw PGSDKaccessException(NSLocalizedString(@"你要访问的目标内容,并不是\"unsignedLong\"", nil),((NSObject*)object).class,object);
#endif
        return 0;
    }
}
-(long long)PGSDK_longlongValueAtIndex:(NSUInteger)index{
    id object = [self PGSDK_objectAtIndex:index];
    //如果返回内容为空
    if (object == nil) return 0;
    
    if ([object respondsToSelector:@selector(longLongValue)]) {
        return [object longLongValue];
    }else{
#if DEBUG
        @throw PGSDKaccessException(NSLocalizedString(@"你要访问的目标内容,并不是\"longLong\"", nil),((NSObject*)object).class,object);
#endif
        return 0;
    }
}

-(unsigned long long)PGSDK_unsignedlonglongValueAtIndex:(NSUInteger)index{
    id object = [self PGSDK_objectAtIndex:index];
    //如果返回内容为空
    if (object == nil) return 0;
    
    if ([object respondsToSelector:@selector(unsignedLongLongValue)]) {
        return [object unsignedLongLongValue];
    }else{
#if DEBUG
        @throw PGSDKaccessException(NSLocalizedString(@"你要访问的目标内容,并不是\"unsignedLongLong\"", nil),((NSObject*)object).class,object);
#endif
        return 0;
    }
}

-(int)PGSDK_intValueAtIndex:(NSUInteger)index{
    id object = [self PGSDK_objectAtIndex:index];
    //如果返回内容为空
    if (object == nil) return 0;
    
    if ([object respondsToSelector:@selector(intValue)]) {
        return [object intValue];
    }else{
#if DEBUG
        @throw PGSDKaccessException(NSLocalizedString(@"你要访问的目标内容,并不是\"int\"", nil),((NSObject*)object).class,object);
#endif
        return 0;
    }
}

-(unsigned int)PGSDK_unsignedIntValueAtIndex:(NSUInteger)index{
    id object = [self PGSDK_objectAtIndex:index];
    //如果返回内容为空
    if (object == nil) return 0;
    
    if ([object respondsToSelector:@selector(unsignedIntValue)]) {
        return [object unsignedIntValue];
    }else{
#if DEBUG
        @throw PGSDKaccessException(NSLocalizedString(@"你要访问的目标内容,并不是\"int\"", nil),((NSObject*)object).class,object);
#endif
        return 0;
    }
}


@end
