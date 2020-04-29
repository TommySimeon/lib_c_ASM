bits 64
section .text
global strncmp

strncmp:
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
    inc rax
    cmp rax, rdx
    jz end
    jmp for

ret_null:
    xor rax, rax
    ret

ret_neg:
    cmp bh, 0
    jz ret_null
    mov rax, 1
    ret

ret_pos:
    cmp ah, 0
    jz ret_null
    mov rax, -1
    ret

end:
    cmp ah, 0
    jz ret_neg
    cmp bh, 0
    jz ret_pos
    cmp rax, rdx
    jz ret_null
    mov r8b, byte[rdi + rcx]
    mov r9b, byte[rsi + rcx]
    cmp r8b, r9b
    jc ret_pos
    jmp ret_neg