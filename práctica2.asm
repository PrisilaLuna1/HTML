.386
.model flat, stdcall
.stack 4096
 
ExitProcess proto, dwExitCode:dword
 
.data
array_size equ 10
array db array_size dup(0)
count_multiples_of_three db 0
  
.code

main proc
 mov rcx, array_size
    lea rsi, [array]
    mov al, 1
fill_array:
    mov [rsi], al
    add al, 2
    inc rsi
    loop fill_array

    ; Contar cuántos elementos del arreglo son múltiplos de 3
    mov rcx, array_size
    lea rsi, [array]
    xor al, al
count_multiples:
    mov bl, [rsi]
    test bl, 1
    jz not_odd
    and bl, 0FH
    cmp bl, 3
    jne not_multiple_of_three
    inc al
not_multiple_of_three:
not_odd:
    inc rsi
    loop count_multiples


invoke ExitProcess,0

main endp

end main
