bits 64
section .text
global strcasecmp

strcasecmp:
	xor rcx, rcx

take_value:
	mov ah, [rdi + rcx]
	mov bh, [rsi + rcx]

for:
	cmp ah, 0
	je end
	cmp bh, 0
	je end
	cmp ah, 91
	jl check_up_ah

check_scd_up:
	cmp bh, 91
	jl check_up_bh

last_check:
	cmp ah, bh
	jne end
	jmp same_value

same_value:
	inc rcx
	jmp take_value

check_up_ah:
	cmp ah, 64
	jg ah_to_lowcase
	jmp check_scd_up

check_up_bh:
	cmp bh, 64
	jg bh_to_lowcase
	jmp last_check

ah_to_lowcase:
	add ah, 32
	jmp for

bh_to_lowcase:
	add bh, 32
	jmp for

end:
	mov rax, ah
	sub rax, bh
	ret