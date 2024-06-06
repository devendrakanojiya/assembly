.section .data
msg:
    .ascii "Linus Torvalds and Richard Stallman are legends\n"
msg_len = . - msg

.section .text
.globl _start

_start:

    mov r0, #1         
    ldr r1, =msg       
    ldr r2, =msg_len   
    mov r7, #4         
    svc #0             


    mov r0, #0         
    mov r7, #1        
    svc #0            
