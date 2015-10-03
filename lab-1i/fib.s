	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	push {r3, r4, r5, lr}
	
	mov r3, #0
	mov r4, #1

	cmp r0, #0
	beq .L3

	cmp r0, #1
	beq .L4

.LOOP:
	add r5, r3, r4
	mov r3, r4
	mov r4, r5

	sub r0, r0, #1
	cmp r0, #1
	bne .LOOP

	mov r0, r5
	pop {r3, r4, r5, pc}		@EPILOG

.L3:
	mov r0, #0			@ R0 = 0
	pop {r3, r4, r5, pc}		@ EPILOG

.L4:
	mov r0, #1			@ R0 = 1
	pop {r3, r4, r5, pc}		@ EPILOG

	.size fibonacci, .-fibonacci
	.end
