;---------------------------Sum of Grades----------------------------;
;---------Itzik Moalem----------------------------313181638----------;

;The program get 2 numbers and check all the numbers include them
;if there is a prime numbers its save them in array
;and printing the array in the end of the program

%include "io.inc"

section .data
msg db "Enter first number: " ,10, 0
msg2 db "Enter secend number: " ,10, 0
msg3 db "The prime numbers is: ", 0
  
section .bss
divider resd 1
result resd 100
  
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    PRINT_STRING msg
    GET_DEC 4, eax    ;minimum number
    PRINT_STRING msg2
    GET_DEC 4, ebx    ;max number
    mov esi, 0
    mov ecx, 0

next:
    mov edx, eax    ;save the number in esi
    mov byte[divider], 2    ;start the divider from 2


check_prime:    ;checking if the number is prime
    div byte[divider]
    inc byte[divider]
    cmp ah, 0
    jz next_number    ;if not prime
    mov eax, edx        ;back to eax the curry num
    cmp eax, [divider]       ;loop for checking until num '-1'
    jnz check_prime
    jz prime_num

prime_num:  ;save the number if its got here
    mov [result+esi*4], edx
    inc esi
    inc ecx
    
next_number:    ;moving to next number
    mov eax, edx
    add eax, 1
    cmp ebx, edx
    jnz next
    jz reset_esi

reset_esi:  ;reset esi for printing the results
    mov esi, 0    
    PRINT_STRING msg3
    
print:  ;printing the prime numbers
    PRINT_DEC 4, [result+esi*4]
    PRINT_STRING " "
    inc esi
    dec ecx
    cmp ecx, 0   
    jg print
    
end:
    xor eax, eax
    ret