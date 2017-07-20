
;KITRI BOB 6th 
;Consulting Track
;Cho Hui Gwon

section .data
		;data input
msg: db "*"
ent: db 0x0a

section .text

global _start

_start:

	push rbp
	mov rbp, rsp
	lea rax, [rbp+0x18]
	mov rbx, [rax]
	movzx rbx, byte[rbx]
	sub rbx, 0x30	;	ASCII -> integer
	cmp rbx, 9
	jge endpoint
	mov r8, 0
	mov r9, 0
temp:
	add r9, 1
	mov r8, 0
count:  
	add r8, 1	
	mov rax, 1 
	mov rdi, 1
	mov rsi, msg
	mov rdx, 1
	syscall	
	cmp r9, r8
	jne count
	mov rax, 1
	mov rdi, 1
	mov rsi, ent
	mov rdx, 1
	syscall
	cmp r9, rbx
	jne temp

temp1:
	sub r9, 1
	mov r8, 0
count1:
	add r8, 1
	mov rax, 1
	mov rdi, 1
	mov rsi, msg
	mov rdx, 1
	syscall
	cmp r9, r8
	jne count1
	mov rax, 1
	mov rdi, 1
	mov rsi, ent
	mov rdx, 1
	syscall
	cmp r9, 1
	jne temp1

endpoint:
	mov rax, 1
	mov rbx, 0
	int 0x80

