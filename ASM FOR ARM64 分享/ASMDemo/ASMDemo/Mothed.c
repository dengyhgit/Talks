//
//  Mothed.c
//  ASMDemo
//
//  Created by 邓永豪 on 2018/8/15.
//  Copyright © 2018年 邓永豪. All rights reserved.
//

#include "Mothed.h"

// xcrun --sdk iphoneos clang -S -arch arm64 Mothed.m -o Mothed.s

int func2(int a, int b) {
    int c = a + b;
    return c;
}

void func1() {
    int a = 6;
    int b = 8;
    int c = func2(a, b);
}

