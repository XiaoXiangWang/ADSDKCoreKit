//
//  NSMutableArray+PGSDKCommon.m
//  PGFoundationKit
//
//  Created by 汪潇翔 on 15/4/30.
//  Copyright (c) 2015年 PGSDK. All rights reserved.
//

#import "NSMutableArray+PGSDKCommon.h"

@implementation NSMutableArray (PGSDKCommon)
-(void)PGSDK_addObject:(id)object{
    @try {
        [self addObject:object];
    }
    @catch (NSException *exception) {
        NSLog(@"#Exception:%@",exception);
    }
    @finally {
        
    }
}
@end
