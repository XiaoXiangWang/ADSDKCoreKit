//
//  NSMutableArray+PGSDKCommon.h
//  PGFoundationKit
//
//  Created by 汪潇翔 on 15/4/30.
//  Copyright (c) 2015年 PGSDK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (PGSDKCommon)
-(void)PGSDK_addObject:(id)object;

-(void)PGSDK_addString:(NSString*)string;

-(void)PGSDK_addBOOLValue:(BOOL)i;

-(void)PGSDK_addIntValue:(int)i;

-(void)PGSDK_addIntegerValue:(NSInteger)i;

-(void)PGSDK_addUnsignedIntegerValue:(NSUInteger)ui;

-(void)PGSDK_addCGFloatValue:(CGFloat)cf;

-(void)PGSDK_addCharValue:(char)c;

-(void)PGSDK_addFloatValue:(float)f;
@end
