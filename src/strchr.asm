bits 64
section .text
    global strchr

strchr:
    xor rcx, rcx

while:
cmp byte [rdi], sil
je end
cmp byte [rdi], 0
je err
inc rdi
jmp while

err:
    mov rax, 0
    ret

end:
    lea rax, [rdi + rcx]
    ret