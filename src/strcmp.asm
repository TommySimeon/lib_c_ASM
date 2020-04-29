bits 64
section .text
global strcmp

strcmp:
    xor rax, rax
    xor rcx, rcx

for:
    mov ah, byte [rdi + rcx]
    mov bh, byte [rsi + rcx]
    cmp ah, 0
    jz end
    cmp bh, 0
    jz end
    cmp ah, bh
    jnz end
    inc rcx
    jmp for

ret_null:
    mov rax, 0
    ret

ret_neg:
    cmp bh, 0
    jz ret_null
    mov rax, -1
    ret

ret_pos:
    cmp ah, 0
    jz ret_null
    mov rax, 1
    ret

end:
    cmp ah, 0
    jz ret_neg
    cmp bh, 0
    jz ret_pos
    mov r8b, byte[rdi + rcx]
    mov r9b, byte[rsi + rcx]
    cmp r8b, r9b
    jc ret_neg
    jmp ret_pos