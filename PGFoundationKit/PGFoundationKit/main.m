//
//  main.m
//  PGFoundationKit
//
//  Created by 汪潇翔 on 15/4/30.
//  Copyright (c) 2015年 PGSDK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSMutableArray+PGSDKCommon.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
       
        NSMutableDictionary* dictionary = [[NSThread currentThread] threadDictionary];
        NSLog(@"%@",dictionary);
    }
    return 0;
}
