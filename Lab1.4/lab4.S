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
step1:
  bvc step2
  lsrs r1, #1
  rrx r0, r0

step2:
  cmp r1, 0

step3:
  ITT EQ
  movEQ r0, #8101
  lslEQ r0, r0, #19

step4:
  mov r7, #8101
  add r1, r7

step5:
  and r3, r0, #0xC0000000
  cmp r3, #0x80000000

step6:
  ITT EQ
  asrEQ r1, r1, #1
  asrEQ r0, r0, #1

step7:
  pop {pc}

task2:
	push {lr}
	mov r1, #12
	mov r2, #8

prog_a:
	mov r0, #5
	add r0, r1, r0
	bl prog_b

jmp3:
	lsls r1, #1
	bcs jmp1
	lsls r0, #1
	b jmp2

jmp1:
	add r0, #7
	subs r1, r0
    
jmp2:
	bvs jmp3
	lsl r0, #2
	pop {pc}

prog_b:
	push {lr}

jmp5:
	subs r2, #2
	bmi jmp4
	bl prog_c
	adds r2, r1

jmp4:
	bcs jmp5
	add r2, r0
	lsr r1, #2
	pop {pc}

prog_c:
	push {lr}
	mov r2, r2
	mov r1, #54
	pop {pc}