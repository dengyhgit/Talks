.text
.global _testB, _testBL

_testB:
b jumpB
mov x0, #0x3  ;这里并不会执行
ret

jumpB:
mov x0, #0x2
ret

_testBL:
b jumpBL
mov x0, #0x3  ;这里会被执行
ret

jumpBL:
mov x0, #0x2
ret

