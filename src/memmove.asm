bits 64
section .text
    global memmove

memmove:
    xor rcx, rcx

while:
cmp rdx, 0
je end
mov byte ah, [rsi + rcx]
mov byte [rdi + rcx], ah
inc rcx
dec rdx
jmp while

end:
    mov rax, rdi
    ret