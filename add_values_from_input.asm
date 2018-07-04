extern printf
extern scanf
extern exit

section .text
	global main

main:
	mov ebp, esp
	sub esp, 8				; reserves 8 bytes on the stack
	mov dword [ebp-8],	0
	mov dword [ebp-4],	0
	mov dword [ebp],	0
	push msg1				; 'Enter first number: '
	call printf
	add esp, 4	
	lea eax, [ebp-8]		; effective address from [ebp-8] is in eax now
	push eax
	push format				; "%i"
	call scanf
	add esp, 8	
	push msg2				; 'Enter second number: '
	call printf
	add esp, 4	
	lea eax, [ebp-4]		; effective address from [ebp-8] is in eax now
	push eax
	push format				; "%i"
	call scanf
	add esp, 8
	mov edx, [ebp-8]		; effective address from [ebp-8] where is the first variable
	mov eax, [ebp-4]		; effective address from [ebp-4] where is the second variable
	add eax, edx
	mov [ebp], eax			; move result to the variable from [ebp-4]
	mov eax, [ebp]			; move the result to eax
	push eax
	push msg3
	call printf
	add esp, 8
	
	call exit

section .data
msg1 db 'Enter first number: ',0
msg2 db 'Enter second number: ',0
msg3 db 'Result: %i',0
format db "%i",0
