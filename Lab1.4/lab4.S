.global lab4
.syntax unified

#define X1 #12
#define X2 #2
#define X3 #-10
#define X4 #15

lab4:
    push {lr}
    bl task1
    bl task2
    pop {pc}

task1:
    push {lr}
    mov r0, X1
    mov r1, #0
    
    mov r2, X2
    mov r3, #0
    
    mov r4, X3
    mov r5, #0xFFFFFFFF
    
    mov r6, X4
    mov r7, #0
    
    // Calculation: 4 * (X1 / 2 + X2) - (X3 + 1 - X4) / 4
    
    // X1 / 2
    asr r0, #1
    asr r1, #1
    
    // (X1 / 2 + X2)
    adds r0, r2
    adc r1, r3
    
    // 4 * (X1 / 2 + X2)
    lsls r0, #1
    rrx r1, r1
    lsls r0, #1
    rrx r1, r1
 
    // X3 + 1
    adds r4, #1
    adc r5, #1
    
    // (X3 + 1 - X4)
    subs r4, r6
    sbc r5, r7
    
    // (X3 + 1 - X4) / 4
    asr r4, #2
    asr r5, #2

    // 4 * (X1 / 2 + X2) - (X3 + 1 - X4) / 4
    subs r0, r4
    sbc r1, r5

    bl result_correction
    pop {pc}
// Result correction

result_correction:
    push {lr}
    bvc step2
    lsr r0, #1
    lsr r1, #1

step2:
    orr r0, #0
    bne step4
    orr r1, #0
    bne step4
    mov r0, #0b10100101

step4:
    add r1, #0b10100101
    and r5, r1, #0xc0000000
    beq step7
    eor r5, #0xc0000000
    beq step7
    lsr r0, #1
    lsr r1, #1

step7:
    bvs end_correction
    push {r0}
    push {r1}
    pop {r1}
    pop {r0}

end_correction:
    pop {pc}

task2:
	push {lr}
	mov r1, #12
	mov r2, #8

prog_a:
	mov r0, #5
	add r0, r1, r0
	bl prog_b
l3:
	lsl r1, #1
	bcc l1
	lsr r0, #1
	b l2
l1:
	add r0, #7
	sub r1, r0
l2:
	bvc l3
	lsl r0, r1
	pop {pc}

prog_b:
	push {lr}
l5:
	sub r2, #2
	bne l4
	bl prog_c
	add r2, r1
l4:
	bcc l5
	sub r2, r0
	lsr r1, r0
	pop {pc}

prog_c:
	push {lr}
	mov r2 = r2
	mov r1, #54
	pop {pc}