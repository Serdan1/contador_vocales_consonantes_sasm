%include "io.inc"

section .data
    ; mensajes definidos en fase 3

section .bss
    ; buffer resb 101
    ; vocales resd 1
    ; consonantes resd 1
    ; espacios resd 1

section .text
global CMAIN

CMAIN:
    mov ebp, esp

INICIO:
    ; reset contadores
    ; pedir texto
    ; leer string en buffer
    ; esi = buffer

RECORRIDO:
    ; al = [esi]
    ; if al == 0 -> MOSTRAR_RESULTADOS
    ; if al == espacio -> espacios++
    ; validar letra
    ; detectar vocal o consonante
    ; inc esi
    ; jmp RECORRIDO

ERROR:
    ; imprimir error
    ; jmp INICIO

MOSTRAR_RESULTADOS:
    ; imprimir vocales
    ; imprimir consonantes
    ; imprimir espacios

FIN:
    xor eax, eax
    ret