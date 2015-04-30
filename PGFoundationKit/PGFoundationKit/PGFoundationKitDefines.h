//
//  PGFoundationKitDefines.h
//  PGFoundationKit
//
//  Created by 汪潇翔 on 15/4/30.
//  Copyright (c) 2015年 PGSDK. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef PGSDK_BUILD_IN_MAC
    #define PGFoundationKit_BUILD_IN_MAC !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE) && TARGET_OS_MAC
#endif

#ifndef PGSDK_BUILD_IN_IOS
    #define PGFoundationKit_BUILD_IN_IOS TARGET_OS_EMBEDDED || TARGET_OS_IPHONE
#endif