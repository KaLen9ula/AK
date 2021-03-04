.global lab1
.syntax unified
#define A #1
#define B #2
#define C #3
lab1:
    push {lr}
    mov r0, A
    mov r1, B
    mov r2, C
    sub r3, r0, r1
    mov r8, 3
    mul r4, r3, r8
    mov r5, 1
    lsl r6, r5, r2
    add r7, r4, r6
    pop {pc}
    
