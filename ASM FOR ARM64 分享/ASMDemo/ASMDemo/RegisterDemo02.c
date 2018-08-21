//
//  RegisterDemo02.c
//  ASMDemo
//
//  Created by 邓永豪 on 2018/8/17.
//  Copyright © 2018年 邓永豪. All rights reserved.
//

#include "RegisterDemo02.h"

// xcrun --sdk iphoneos clang -S -arch arm64 RegisterDemo02.c -o RegisterDemo02.s

int addFunc01(int a, int b) {
    int c = a + b;
    int d = c * 3 * 5;
    int e = c * c;
    int f = c * 2 * 3;
    return d;
}
