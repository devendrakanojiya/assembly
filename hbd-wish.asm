.section .data
prompt:
    .asciz "Enter your name buddy: "
greeting:
    .asciz "Happy Birthday, "
newline:
    .asciz "\n"

.section .bss
name:
    .space 100

.section .text
.global _start

_start:
    // Display prompt
    mov r0, #1          
    ldr r1, =prompt    
    mov r2, #18       
    mov r7, #4          
    swi 0              

    // Read user input
    mov r0, #0         
    ldr r1, =name     
    mov r2, #100        
    mov r7, #3          
    swi 0              

    // Print greeting
    mov r0, #1          
    ldr r1, =greeting  
    mov r2, #14         
    mov r7, #4         
    swi 0               


    mov r0, #1         
    ldr r1, =name      
    bl strlen          
    add r1, r1, r0     
    ldrb r2, [r1]       
    mov r7, #4         
    swi 0               


    mov r0, #1          
    ldr r1, =newline    
    mov r2, #1          
    mov r7, #4         
    swi 0               

    // Exit program
    mov r7, #1          
    swi 0               

strlen:
    mov r3, #0          
loop:
    ldrb r4, [r1], #1   
    cmp r4, #0          
    addne r3, r3, #1    
    bne loop            
    mov pc, lr         
