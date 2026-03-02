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

    inc esi
    jmp RECORRIDO

ES_ESPACIO:
    inc dword [espacios]
    inc esi
    jmp RECORRIDO

MOSTRAR_RESULTADOS:
    jmp FIN

FIN:
    xor eax, eax
    ret