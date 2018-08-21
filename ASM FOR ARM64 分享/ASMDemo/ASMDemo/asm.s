.text
.global _addMothed, _testMOV, _testCMP

_addMothed:
add x0, x0, x1
ret

_testMOV:
mov x1, #0x6
mov x2, x1
ret


_testCMP:
cmp x1, #0x6
b.eq cmpJump
ret

cmpJump:
mov x1, #0x1
ret

_testADD:
add x0, x0, x1
add x0, x0, #1 ;x0 ← x0 + 1
ret

_testSUB:
sub x0, x0, x1
ret

_testAND:
and x0, x0, x1
ret


