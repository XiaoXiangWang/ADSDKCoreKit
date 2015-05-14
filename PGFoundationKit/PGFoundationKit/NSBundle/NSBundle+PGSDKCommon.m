//
//  NSBundle+PGSDKCommon.m
//  PGFoundationKit
//
//  Created by 汪潇翔 on 15/5/8.
//  Copyright (c) 2015年 PGSDK. All rights reserved.
//

#import "NSBundle+PGSDKCommon.h"

#if !__has_feature(objc_arc)
#error NSBundle+PGSDKCommon must be built with ARC.
// You can turn on ARC for files by adding -fobjc-arc to the build phase for each of its files.
#endif

@implementation NSBundle (PGSDKCommon)
+(NSString *)PGSDK_AppVersion{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
};
@end
