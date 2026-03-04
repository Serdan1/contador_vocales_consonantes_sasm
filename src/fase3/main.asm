%include "io.inc"

section .data
    msg_pedir   db "Introduce texto (solo letras y espacios): ", 0
    msg_error   db "ERROR: solo se permiten letras (A-Z, a-z) y espacios.", 0

    msg_v       db "Vocales: ", 0
    msg_c       db "Consonantes: ", 0
    msg_e       db "Espacios: ", 0

section .bss
    buffer      resb 101
    vocales     resd 1
    consonantes resd 1
    espacios    resd 1

section .text
global CMAIN

CMAIN:
    mov ebp, esp

INICIO:
    mov dword [vocales], 0
    mov dword [consonantes], 0
    mov dword [espacios], 0

    PRINT_STRING msg_pedir
    GET_STRING buffer, 100
    NEWLINE

    mov esi, buffer

RECORRIDO:
    mov al, [esi]
    cmp al, 0
    je MOSTRAR_RESULTADOS

    cmp al, ' '
    je ES_ESPACIO

    ; validar letras: A-Z o a-z, si no -> error
    cmp al, 'A'
    jl CARACTER_INVALIDO
    cmp al, 'Z'
    jle ES_LETRA

    cmp al, 'a'
    jl CARACTER_INVALIDO
    cmp al, 'z'
    jle ES_LETRA

    jmp CARACTER_INVALIDO

ES_ESPACIO:
    inc dword [espacios]
    inc esi
    jmp RECORRIDO

ES_LETRA:
    ; todavía no contamos vocal/consonante
    inc esi
    jmp RECORRIDO

CARACTER_INVALIDO:
    PRINT_STRING msg_error
    NEWLINE
    jmp INICIO

MOSTRAR_RESULTADOS:
    jmp FIN

FIN:
    xor eax, eax
    ret