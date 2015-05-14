//
//  NSArray+PGSDKAccess.h
//  PGFoundationKit
//
//  Created by 汪潇翔 on 15/4/30.
//  Copyright (c) 2015年 PGSDK. All rights reserved.
//


#import <CoreGraphics/CoreGraphics.h>
#import <QuartzCore/QuartzCore.h>

#if TARGET_OS_MAC
#import <Foundation/Foundation.h>
#elif TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR
#endif


@interface NSArray (PGSDKAccessClass)

-(id)PGSDK_objectAtIndex:(NSUInteger)index;

-(id)PGSDK_objectAtIndex:(NSUInteger)index class:(Class)cla;

-(NSString*)PGSDK_stringAtIndex:(NSUInteger)index;

-(NSNumber*)PGSDK_numberAtIndex:(NSUInteger)index;

-(NSArray*)PGSDK_arrayAtIndex:(NSUInteger)index;

-(NSDictionary*)PGSDK_dictionaryAtIndex:(NSUInteger)index;

-(NSValue*)PGSDK_valueAtIndex:(NSUInteger)index;

@end

@interface NSArray (PGSDKAccessBaseType)

-(NSInteger)PGSDK_integerValueAtIndex:(NSUInteger)index;

-(NSUInteger)PGSDK_unsignedIntegerValueAtIndex:(NSUInteger)index;

-(CGFloat)PGSDK_CGFloatAtIndex:(NSUInteger)index;

-(BOOL)PGSDK_BOOLValueAtIndex:(NSUInteger)index;

-(int)PGSDK_intValueAtIndex:(NSUInteger)index;

-(unsigned int)PGSDK_unsignedIntValueAtIndex:(NSUInteger)index;

-(long)PGSDK_longValueAtIndex:(NSUInteger)index;

-(unsigned long)PGSDK_unsignedLongValueAtIndex:(NSUInteger)index;

-(long long)PGSDK_longlongValueAtIndex:(NSUInteger)index;

-(unsigned long long)PGSDK_unsignedlonglongValueAtIndex:(NSUInteger)index;

-(char)PGSDK_charValueAtIndex:(NSUInteger)index;

-(short)PGSDK_shortValueAtIndex:(NSUInteger)index;

-(float)PGSDK_floatValueAtIndex:(NSUInteger)index;

-(double)PGSDK_doubleValueAtIndex:(NSUInteger)index;
@end
