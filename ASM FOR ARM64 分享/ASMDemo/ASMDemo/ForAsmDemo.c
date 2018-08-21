//
//  ForAsmDemo.c
//  ASMDemo
//
//  Created by 邓永豪 on 2018/8/17.
//  Copyright © 2018年 邓永豪. All rights reserved.
//

#include "ForAsmDemo.h"

// xcrun --sdk iphoneos clang -S -arch arm64 ForAsmDemo.c -o ForAsmDemo.s

void forFunc() {
    for (int i = 0; i <10; i++) {
        int a = i * 3;
    }
}
