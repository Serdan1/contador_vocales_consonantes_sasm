# Plan del proyecto — Contador de vocales, consonantes y espacios (SASM)

## Objetivo
Crear un programa en SASM (x86, io.inc) que:
- Lea una cadena con longitud máxima (buffer fijo de 100 caracteres).
- Valide que solo contiene letras (A–Z, a–z) y espacios.
- Cuente: vocales, consonantes y espacios.
- No distinga mayúsculas y minúsculas.
- Si hay caracteres inválidos, longitud superior a 100 o cadena vacía, muestre error y permita reintentos ilimitados.

## Reglas de validación
Entrada permitida:
- Letras: 'A'..'Z' y 'a'..'z'
- Espacio: ' '

Entrada NO permitida (error):
- Números (0–9)
- Símbolos (!@#$...)
- Tabulaciones
- Saltos de línea dentro del texto
- Letras con tilde (á, é, etc.)
- ñ
- Cualquier carácter fuera del rango ASCII estándar de letras


Longitud:
- Máximo: 100 caracteres + terminador 0
- Si se supera → error y reintento

Mayúsculas/minúsculas:
- No se distingue (A = a)
- Se normalizará a mayúscula antes de comprobar vocales

Comportamiento ante error:
- Mostrar mensaje claro
- Permitir reintentos ilimitados
- No finalizar hasta recibir entrada válida

## Fases y entregables

### Fase 0 — Repo y estructura 
**Entregable:** 
- Repo creado
- Carpetas src/ y docs/
- Archivo docs/fases.md

### Fase 1 — Especificación y UX 
**Objetivo:**
Definir completamente las reglas del programa antes de programar.

**Entregables:**
- README con reglas y ejemplos de uso
- Lista de mensajes del programa (prompt y errores)

**Checklist:**
- [ ] Objetivo del programa definido
- [ ] Reglas de validación claras
- [ ] Límite de longitud definido (100)
- [ ] Reintentos ilimitados definid
- [ ] Formato de salida definido
- [ ] Al menos 5 ejemplos válidos
- [ ] Al menos 5 ejemplos inválidos

### Fase 2 — Diseño técnico 

## Objetivo
Definir el algoritmo completo antes de implementarlo.

**Entregables:**
- `docs/explicacion-tecnica.md` con:
  - Flujo general del programa
  - Bucle de reintento ilimitado
  - Control de longitud (Opción A: recorrer máximo 101 bytes)
  - Recorrido del string con ESI
  - Validación por rangos ASCII
  - Normalización a mayúscula (AL = AL - 32 si está en a..z)
  - Comparación con vocales A, E, I, O, U
  - Gestión de errores

**Checklist:**
- [ ] Flujo general definido
- [ ] Uso de registros definido (ESI, AL, etc.)
- [ ] Validación ASCII definida
- [ ] Normalización a mayúscula definida
- [ ] Estrategia de reintento ilimitado definida
- [ ] Control de longitud Opción A definido
- [ ] Sin ambigüedades técnicas

### Fase 3 — Implementación
**Objetivo:**
Implementar el programa en src/contar.asm.

**Entregables:**
- `src/contar.asm` compilable en SASM.
- Código comentado claramente
- Manejo completo de errores

**Checklist:**
- [ ] Lectura de string con buffer fijo (101 bytes)
- [ ] Bucle principal de reintentos ilimitados
- [ ] Control de cadena vacía
- [ ] Control de longitud (máx. 100)
- [ ] Recorrido byte a byte con ESI
- [ ] Validación ASCII por rangos
- [ ] Normalización a mayúscula
- [ ] Conteo correcto de vocales
- [ ] Conteo correcto de consonantes
- [ ] Conteo correcto de espacios
- [ ] Salida con formato:
    - Vocales: X
    - Consonantes: Y
    - Espacioes: Z

### Fase 4 — Pruebas y pulido
## Objetivo
Verificar funcionamiento completo y cerrar proyecto profesionalmente.

**Entregables:**
- Casos de prueba en README
- docs/explicacion-tecnica.md actualizado
- Release v1.0 en GitHub

**Checklist:**
- [ ] Casos válidos:
- [ ] Casos inválidos:
- [ ] Caso límite: 100 caracteres exactos (válido)
- [ ] Caso límite: más de 100 (error)
- [ ] Cadena vacía (error)
- [ ] Resultados correctos en todos los casos
- [ ] Código revisado y limpio
- [ ] Tag v1.0 creado en GitHub

### Flujo general del programa
´´´
INICIO
   ↓
Solicitar texto
   ↓
Validar cadena vacía
   ↓
Controlar longitud
   ↓
Recorrer carácter por carácter
   ↓
¿Carácter válido?
   ↓             ↓
   NO            SÍ
   ↓             ↓
Mostrar error     Contar (vocal/consonante/espacio)
   ↓             ↓
Reintentar        ¿Fin cadena?
                     ↓
                 Mostrar resultados
                     ↓
                    FIN
´´´

                  