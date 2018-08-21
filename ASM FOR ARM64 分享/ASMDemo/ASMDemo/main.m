//
//  main.m
//  ASMDemo
//
//  Created by 邓永豪 on 2018/6/27.
//  Copyright © 2018年 邓永豪. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "asm.h"
#import "testB.h"
#import "RegisterDemo.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        int a = 10;
        int b = 20;
        if (a > b) {
            printf("");
        }
        printf("%d", addMothed(3, 5));
        testB();
        testCMP();
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
