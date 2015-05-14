//
//  NSValue+PGSDKTransform.m
//  PGFoundationKit
//
//  Created by 汪潇翔 on 15/4/30.
//  Copyright (c) 2015年 PGSDK. All rights reserved.
//

#import "NSValue+PGSDKTransform.h"


#if !__has_feature(objc_arc)
#error NSValue+PGSDKTransform must be built with ARC.
// You can turn on ARC for files by adding -fobjc-arc to the build phase for each of its files.
#endif
@implementation NSValue (PGSDKTransform)

-(CATransform3D)PGSDK_CATransform3DValue{
    return [self CATransform3DValue];
}

#if PGFoundationKit_BUILD_IN_IOS
//iOS
+ (NSValue *)PGSDK_valueWithCGPoint:(CGPoint)point{
    return [NSValue valueWithCGPoint:point];
}
+ (NSValue *)PGSDK_valueWithCGVector:(CGVector)vector{
    return [NSValue valueWithCGVector:vector];
}
+ (NSValue *)PGSDK_valueWithCGSize:(CGSize)size{
    return [NSValue valueWithCGSize:size];
}
+ (NSValue *)PGSDK_valueWithCGRect:(CGRect)rect{
    return [NSValue valueWithCGRect:rect];
}
+ (NSValue *)PGSDK_valueWithCGAffineTransform:(CGAffineTransform)transform{
    return [NSValue valueWithCGAffineTransform:transform];
}

+ (NSValue *)PGSDK_valueWithUIEdgeInsets:(UIEdgeInsets)insets{
    return [NSValue valueWithUIEdgeInsets:insets];
}
+ (NSValue *)PGSDK_valueWithUIOffset:(UIOffset)insets{
    return [NSValue valueWithUIOffset:insets];
}

-(UIEdgeInsets)PGSDK_UIEdgeInsetsValue{
    return [self UIEdgeInsetsValue];
}
-(UIOffset)PGSDK_UIOffsetValue{
    return [self UIOffsetValue];
}

-(CGPoint)PGSDK_CGPointValue{
    return [self CGPointValue];
}
-(CGSize)PGSDK_CGSizeValue{
    return [self CGSizeValue];
}
-(CGRect)PGSDK_CGRectValue{
    return [self CGRectValue];
}
-(CGVector)PGSDK_CGVectorValue{
    return [self CGVectorValue];
}
-(CGAffineTransform)PGSDK_CGAffineTransformValue{
    return [self CGAffineTransformValue];
}
#elif PGFoundationKit_BUILD_IN_MAC
+ (NSValue *)PGSDK_valueWithCGPoint:(CGPoint)point{
    return [self PGSDK_valueWithPoint:point];
}
+ (NSValue *)PGSDK_valueWithCGVector:(CGVector)vector{
    return [NSValue value:&vector withObjCType:@encode(CGVector)];
}
+ (NSValue *)PGSDK_valueWithCGSize:(CGSize)size{
    return [self PGSDK_valueWithSize:size];
}
+ (NSValue *)PGSDK_valueWithCGRect:(CGRect)rect{
    return [self PGSDK_valueWithRect:rect];
}
+ (NSValue *)PGSDK_valueWithCGAffineTransform:(CGAffineTransform)transform{
    return [NSValue value:&transform withObjCType:@encode(CGAffineTransform)];
}


+ (NSValue *)PGSDK_valueWithPoint:(NSPoint)point{
    return [NSValue valueWithPoint:point];
}
+ (NSValue *)PGSDK_valueWithSize:(NSSize)size{
    return [NSValue valueWithSize:size];
}
+ (NSValue *)PGSDK_valueWithRect:(NSRect)rect{
    return [NSValue valueWithRect:rect];
}
+ (NSValue *)PGSDK_valueWithEdgeInsets:(NSEdgeInsets)insets{
    return [NSValue valueWithEdgeInsets:insets];
}

-(CGPoint)PGSDK_CGPointValue{
    return [self PGSDK_pointValue];
}
-(CGSize)PGSDK_CGSizeValue{
    return [self PGSDK_sizeValue];
}
-(CGRect)PGSDK_CGRectValue{
    return [self PGSDK_rectValue];
}
-(CGVector)PGSDK_CGVectorValue{
    CGVector vector = CGVectorMake(0, 0);
    [self getValue:&vector];
    return vector;
}
-(CGAffineTransform)PGSDK_CGAffineTransformValue{
    CGAffineTransform transform = CGAffineTransformIdentity;
    [self getValue:&transform];
    return transform;
}

-(NSPoint)PGSDK_pointValue{
    return self.pointValue;
}
-(NSSize)PGSDK_sizeValue{
    return self.sizeValue;
}
-(NSRect)PGSDK_rectValue{
    return self.rectValue;
}
-(NSEdgeInsets)PGSDK_edgeInsetsValue{
    return self.edgeInsetsValue;
}
#endif
@end
