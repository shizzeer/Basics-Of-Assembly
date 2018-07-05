global main
extern printf
extern scanf
extern puts
extern exit

section .text
main:
	mov ebp, esp		
	sub esp, 16			
	
	mov dword [ebp-12],	0	
	mov dword [ebp-8],	0	
	mov dword [ebp-4],	0	
	mov dword [ebp],	0	
	push calc_msg			
	call printf				
	add esp, 4
	push choice_msg			
	call printf
	add esp, 4
	push choices
	call puts
	add esp, 4
	push next_choice_msg
	call printf
	add esp, 4
	lea eax, [ebp-12]				
	push eax						
	push format_int				
	call scanf					
	add esp, 8
	push write_first_number_msg		
	call printf
	add esp, 4
	lea eax, [ebp-8]				
	push eax						
	push format_int					
	call scanf						
	add esp, 8
	push write_second_number_msg	
	call printf
	add esp, 4					
	lea eax, [ebp-4]			
	push eax					
	push format_int					
	call scanf						
	add esp, 8
	mov eax, [ebp-12]			
	cmp eax, 2						
	jz subtraction
	cmp eax, 2
	jg cmp_with_3_label
	cmp eax, 1
	jz addition
	jmp default_label

	cmp_with_3_label:
		cmp eax, 3
		jz multiplication
		jmp cmp_with_4_label

	cmp_with_4_label:
		cmp eax, 4
		jz divide
		jmp default_label

	subtraction:
		mov eax, [ebp-8]	
		sub eax, [ebp-4]	
		mov [ebp], eax		
		jmp write_result

	addition:
		mov eax, [ebp-8]
		add eax, [ebp-4]	
		mov [ebp], eax
		jmp write_result

	multiplication:
		mov eax, [ebp-8]
		imul eax			
		mov [ebp], eax
		jmp write_result

	divide:
		mov eax, [ebp-8]
		idiv eax		
		mov [ebp], eax
		jmp write_result

	default_label:
		push bad_option
		call puts			
		add esp, 4
		call exit

	write_result:
		push dword [ebp]
		push write_result_msg
		call printf
		add esp, 8
		call exit

section .data
calc_msg db "~~~~~~~~CALCULATOR~~~~~~~~", 0xa, 0
choice_msg db "Choose one of the operation", 0xa, 0
choices db "1. Addition", 0xa
		db "2. Subtraction", 0xa
		db "3. Multiplication", 0xa
		db "4. Divide", 0
next_choice_msg db "Your choice: ", 0
write_first_number_msg db "Write first number: ", 0
write_second_number_msg db "Write second number: ", 0
bad_option db "You chose bad option.", 0
write_result_msg db "Result: %i", 0xa, 0
format_int db "%i", 0
