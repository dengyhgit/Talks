//
//  AddMothed.c
//  ASMDemo
//
//  Created by 邓永豪 on 2018/8/6.
//  Copyright © 2018年 邓永豪. All rights reserved.
//

#include "AddMothed.h"


// xcrun --sdk iphoneos clang -S -arch arm64 AddMothed.c -o AddMothed.s

int add(int a, int b)
{
    int c = a + b;
    return c;
}

//int add2(int a, int b, int c, int d, int e, int f, int g, int h, int l, int m, int n, int a1, int b1, int c1, int d1, int e1, int f1, int g1, int h1, int l1, int m1, int n1, int a2, int b2, int c2, int d2, int e2, int f2, int g2, int h2, int l2, int m2, int n2)
//{
//    int result = a + b + c + d + e + f + g + h + l + m + n + a1 + b1 + c1 + d1 + e1 + f1 + g1 + h1 + l1 + m1 + n1 + a2 + b2 + c2 + d2 + e2 + f2 + g2 + h2 + l2 + m2 + n2;
//    return result;
//}
