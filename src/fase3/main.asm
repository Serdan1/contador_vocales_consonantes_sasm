%include "io.inc"

section .data
    msg_pedir   db "Introduce texto (solo letras y espacios): ", 0
    msg_error   db "ERROR: solo se permiten letras (A-Z, a-z) y espacios.", 0

    msg_v       db "Vocales: ", 0
    msg_c       db "Consonantes: ", 0
    msg_e       db "Espacios: ", 0

section .bss
    buffer          resb 101
    vocales         resd 1
    consonantes     resd 1
    espacios        resd 1
    letras_usadas   resb 26

section .text
global CMAIN

CMAIN:
    mov ebp, esp

INICIO:
    ; Inicializar contadores
    mov dword [vocales], 0
    mov dword [consonantes], 0
    mov dword [espacios], 0

    ; Inicializar array de letras usadas (a-z)
    mov ecx, 26
    mov edi, letras_usadas

LIMPIAR:
    mov byte [edi], 0
    inc edi
    loop LIMPIAR

    ; Pedir texto
    PRINT_STRING msg_pedir
    GET_STRING buffer, 100
    PRINT_STRING buffer
    NEWLINE

    ; Apuntar al inicio del buffer
    mov esi, buffer

RECORRIDO:
    mov al, [esi]
    cmp al, 0
    je MOSTRAR_RESULTADOS

    cmp al, ' '
    je ES_ESPACIO

    ; Validar letras: A-Z o a-z
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
    xor ebx, ebx        ; limpiar ebx
    mov bl, al
    or bl, 32           ; convertir a minúscula
    sub bl, 'a'         ; índice 0-25

    cmp byte [letras_usadas + ebx], 1
    je YA_CONTADA

    mov byte [letras_usadas + ebx], 1

    ; comprobar si es vocal
    cmp al, 'A'
    je SUMAR_VOCAL
    cmp al, 'E'
    je SUMAR_VOCAL
    cmp al, 'I'
    je SUMAR_VOCAL
    cmp al, 'O'
    je SUMAR_VOCAL
    cmp al, 'U'
    je SUMAR_VOCAL

    cmp al, 'a'
    je SUMAR_VOCAL
    cmp al, 'e'
    je SUMAR_VOCAL
    cmp al, 'i'
    je SUMAR_VOCAL
    cmp al, 'o'
    je SUMAR_VOCAL
    cmp al, 'u'
    je SUMAR_VOCAL

    ; consonante nueva
    inc dword [consonantes]
    jmp CONTINUAR

SUMAR_VOCAL:
    inc dword [vocales]

CONTINUAR:
YA_CONTADA:
    inc esi
    jmp RECORRIDO

CARACTER_INVALIDO:
    PRINT_STRING msg_error
    jmp FIN

MOSTRAR_RESULTADOS:
    PRINT_STRING msg_v
    PRINT_DEC 4, [vocales]
    NEWLINE

    PRINT_STRING msg_c
    PRINT_DEC 4, [consonantes]
    NEWLINE

    PRINT_STRING msg_e
    PRINT_DEC 4, [espacios]
    NEWLINE

FIN:
    xor eax, eax
    ret