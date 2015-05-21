//
//  NSBundle+PGSDKCommon.h
//  PGFoundationKit
//
//  Created by 汪潇翔 on 15/5/8.
//  Copyright (c) 2015年 PGSDK. All rights reserved.
//

#import <Foundation/Foundation.h>

#define APP_VERSION [NSBundle PGSDK_AppVersion]

@interface NSBundle (PGSDKCommon)
+(NSString*)PGSDK_AppVersion;
+(NSDictionary*)PGSDK_infoDictionary;
@end
