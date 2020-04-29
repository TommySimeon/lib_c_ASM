bits 64
section .text
global strlen

strlen:
	xor rcx, rcx

for:
	cmp [rdi + rcx], byte 0
	jz end
	inc rcx
	jmp for

end:
	mov rax, rcx
	ret