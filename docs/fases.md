# Plan del proyecto — Contador de vocales, consonantes y espacios (SASM)

## Objetivo
Crear un programa en SASM (x86, io.inc) que:
- Lee una cadena con longitud máxima (buffer fijo).
- Valida que solo contiene letras (A–Z, a–z) y espacios.
- Cuenta: vocales, consonantes y espacios.
- Si hay caracteres inválidos o se supera el límite, muestra error.

## Reglas de validación
Entrada permitida:
- Letras: 'A'..'Z' y 'a'..'z'
- Espacio: ' '

Entrada NO permitida (error):
- Números, símbolos, tabulaciones, saltos de línea dentro del texto, tildes/ñ, etc.

Longitud:
- Máximo: (definir) caracteres + terminador 0.
- Si se supera → error.

Mayúsculas/minúsculas:
- No se distingue (A = a).

## Fases y entregables

### Fase 0 — Repo y estructura (DONE)
**Entregable:** repo creado + carpetas `src/` y `docs/` + `docs/fases.md`.

### Fase 1 — Especificación y UX (mensajes)
**Entregables:**
- README con reglas y ejemplos de uso.
- Lista de mensajes del programa (prompts y errores).
**Responsable A:**
**Responsable B:**
**Checklist:**
- [ ] Texto del objetivo y requisitos en README
- [ ] Ejemplos de entrada/salida
- [ ] Mensajes de error definidos

### Fase 2 — Diseño técnico (sin código)
**Entregables:**
- `docs/explicacion-tecnica.md` con:
  - Diagrama/flujo del algoritmo
  - Cómo se recorre el string
  - Cómo se valida cada carácter
  - Cómo se cuenta vocal/consonante/espacio
  - Qué pasa en error
**Responsable A:**
**Responsable B:**
**Checklist:**
- [ ] Flujo general
- [ ] Validación por rangos ASCII
- [ ] Normalización mayúsculas/minúsculas (concepto)
- [ ] Estrategia de “terminar” o “reintentar” en error (definir)

### Fase 3 — Implementación (código)
**Entregables:**
- `src/contar.asm` compilable en SASM.
- Comentarios claros en el código.
**Responsable A:**
**Responsable B:**
**Checklist:**
- [ ] Lectura de string con buffer fijo
- [ ] Control de longitud
- [ ] Recorrido byte a byte
- [ ] Contadores (vocales, consonantes, espacios)
- [ ] Salida por pantalla con resultados
- [ ] Manejo de errores

### Fase 4 — Pruebas y pulido
**Entregables:**
- Casos de prueba en README (inputs válidos e inválidos).
- Versión 1.0 etiquetada (tag).
**Responsable A:**
**Responsable B:**
**Checklist:**
- [ ] Casos válidos: solo letras, letras+espacios, solo espacios
- [ ] Casos inválidos: números, símbolos, tab, ñ, tildes
- [ ] Casos límite: longitud máxima, vacío
- [ ] Revisión de estilo y comentarios