# FASE 2 — Diseño técnico

## Objetivo
Definir completamente la arquitectura del programa antes de implementar.

---

## Flujo general

INICIO:
    Reset contadores
    Pedir texto
    Recorrer string
    Validar carácter a carácter
    Si error → volver a INICIO
    Si correcto → mostrar resultados

---

## Memoria

### .bss
- buffer → 101 bytes
- vocales → 1 entero (resd 1)
- consonantes → 1 entero
- espacios → 1 entero

---

## Registros usados

- ESI → puntero recorrido buffer
- AL → carácter actual
- EAX → impresión y operaciones
- EBP → convención SASM

---

## Validación ASCII

1. Espacio = ' '
2. Letras válidas:
   - 'A' a 'Z'
   - 'a' a 'z'
3. Cualquier otro carácter = inválido

---

## Detección de vocal

Vocales válidas:
A E I O U
a e i o u

Si no es vocal pero es letra → consonante