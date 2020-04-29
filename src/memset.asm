bits 64
section .text
global memset

memset:
    xor rcx, rcx

for:
    cmp rdx, 0
    je end
    mov byte [rdi + rcx], sil
    inc rcx
    dec rdx
    jmp for

end:
    mov rax, rdi
    ret