bits 64
section .text
global rindex

rindex:
    xor rcx, rcx
    xor rax, rax

for:
    mov r8b, byte[rdi]
    cmp r8b, 0
    je got_to_occ
    inc rcx
    inc rdi
    jmp for

got_to_occ:
    mov r8b, byte[rdi]
    cmp rcx, -1
    je ret_null
    cmp r8b, sil
    je ret_occ
    dec rdi
    dec rcx
    jmp got_to_occ

go_to_back:
    cmp rcx, 0
    je ret_null
    dec rcx
    dec rdi
    jmp go_to_back

ret_occ:
    mov rax, rdi
    jmp go_to_back

ret_null:
    inc rdi
    ret