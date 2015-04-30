//
//  NSValue+PGSDKTransform.h
//  PGFoundationKit
//
//  Created by 汪潇翔 on 15/4/30.
//  Copyright (c) 2015年 PGSDK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import "PGFoundationKitDefines.h"



#if PGFoundationKit_BUILD_IN_IOS
    //iOS
#import <UIKit/UIGeometry.h>
#endif

//---------------------iOS-------------------------
/*
 Header(UIKit/UIGeometry.h)
 + (NSValue *)valueWithCGPoint:(CGPoint)point;
 + (NSValue *)valueWithCGVector:(CGVector)vector;
 + (NSValue *)valueWithCGSize:(CGSize)size;
 + (NSValue *)valueWithCGRect:(CGRect)rect;
 + (NSValue *)valueWithCGAffineTransform:(CGAffineTransform)transform;
 + (NSValue *)valueWithUIEdgeInsets:(UIEdgeInsets)insets;
 + (NSValue *)valueWithUIOffset:(UIOffset)insets NS_AVAILABLE_IOS(5_0);
 
 - (CGPoint)CGPointValue;
 - (CGVector)CGVectorValue;
 - (CGSize)CGSizeValue;
 - (CGRect)CGRectValue;
 - (CGAffineTransform)CGAffineTransformValue;
 - (UIEdgeInsets)UIEdgeInsetsValue;
 - (UIOffset)UIOffsetValue NS_AVAILABLE_IOS(5_0);
 */
//---------------------Mac-------------------------
/*
 Header(Foundation/UIGeometry.h)
 + (NSValue *)valueWithPoint:(NSPoint)point;
 + (NSValue *)valueWithSize:(NSSize)size;
 + (NSValue *)valueWithRect:(NSRect)rect;
 + (NSValue *)valueWithEdgeInsets:(NSEdgeInsets)insets NS_AVAILABLE(10_10, 8_0);
 
 @property (readonly) NSPoint pointValue;
 @property (readonly) NSSize sizeValue;
 @property (readonly) NSRect rectValue;
 @property (readonly) NSEdgeInsets edgeInsetsValue NS_AVAILABLE(10_10, 8_0);
 */

@interface NSValue (PGSDKTransform)

+ (NSValue *)PGSDK_valueWithCGPoint:(CGPoint)point;
+ (NSValue *)PGSDK_valueWithCGSize:(CGSize)size;
+ (NSValue *)PGSDK_valueWithCGRect:(CGRect)rect;
+ (NSValue *)PGSDK_valueWithCGAffineTransform:(CGAffineTransform)transform;
+ (NSValue *)PGSDK_valueWithCGVector:(CGVector)vector;

@property(readonly) CGPoint             PGSDK_CGPointValue;
@property(readonly) CGSize              PGSDK_CGSizeValue;
@property(readonly) CGRect              PGSDK_CGRectValue;
@property(readonly) CGAffineTransform   PGSDK_CGAffineTransformValue;
@property(readonly) CATransform3D       PGSDK_CATransform3DValue ;
@property(readonly) CGVector            PGSDK_CGVectorValue;


#if PGFoundationKit_BUILD_IN_IOS
//iOS
+ (NSValue *)PGSDK_valueWithUIEdgeInsets:(UIEdgeInsets)insets;
+ (NSValue *)PGSDK_valueWithUIOffset:(UIOffset)insets NS_AVAILABLE_IOS(5_0);

@property(readonly) UIEdgeInsets    PGSDK_UIEdgeInsetsValue;
@property(readonly) UIOffset        PGSDK_UIOffsetValue NS_AVAILABLE_IOS(5_0);

#elif PGFoundationKit_BUILD_IN_MAC
+ (NSValue *)PGSDK_valueWithPoint:(NSPoint)point;
+ (NSValue *)PGSDK_valueWithSize:(NSSize)size;
+ (NSValue *)PGSDK_valueWithRect:(NSRect)rect;
+ (NSValue *)PGSDK_valueWithEdgeInsets:(NSEdgeInsets)insets NS_AVAILABLE(10_10, 8_0);

@property (readonly) NSPoint        PGSDK_pointValue;
@property (readonly) NSSize         PGSDK_sizeValue;
@property (readonly) NSRect         PGSDK_rectValue;
@property (readonly) NSEdgeInsets   PGSDK_edgeInsetsValue NS_AVAILABLE(10_10, 8_0);
#endif
@end
