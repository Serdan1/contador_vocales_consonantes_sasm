# contador_vocales_consonantes_sasm

# 1 PROPÓSITO DEL PROGRAMA
El programa debe:
- Solicitar una cadena de texto.
- Validar que cumpla reglas estrictas.
- Contrar:
    - Vocales
    - Consonantes
    - Espacios
- Mostrar resuntados
- Repetir hasta que la entrada sea válida

# 2 DEFINICIÓN FORMAL DE ENTRADA VÁLIDA
Una entrada es válida si y solo si cumple todas las siguientes condiciones:

Longitud

- Logitud mínima: 1 carácter.
- Longitud máxima: 100 caracteres.

Caracteres permitidos

- Letras ASCII mayúsculas (A-Z)
- Letra ASCII minúsculas (a-z)
- Espacio simple (ASCII 32)

Codificación

- Solo ASCII estándar (0-127)

# 3 Definición formar de Errores
La entrada es inválida si ocurre cualquiera de los siguientes:
- Contiene números (0–9)
- Contiene símbolos (!@#$%^&*)
- Contiene tildes (á, é, í, ó, ú)
- Contiene ñ
- Contiene tabulaciones
- Contiene caracteres ASCII extendidos (>127)
- Supera 100 caracteres

# 4 Comportamiento anti Errores
Cuando la entrada es inválida:
- Mostrara: Error entrada no valida
- permitira intentos ilimitados

# 5 Conteo requerido
Para las entradas válidas, tenemos que contrar:
- Total de vocales
- Total de consonantes
- Total de espacios

Definición formal de vocales

Se considera vocales: A E I O U a e i o u

NO se distingue entre mayúsculas y minúsculas.

Definición formal de consonantes

Un consonante es: Cualquier letra ASCII válida que no sea vocal.

# 6  Forma exacta de salida
La salida tiene que tener la siguiente forma:

Vocales: X

Consonantes: Y

Espacios: Z

Cada elemento tiene que estar en lineas independientes.

# 7 Flujo formal del programa
INICIO
   ↓
Solicitar texto
   ↓
¿Texto vacío?
   ↓
¿Supera 100?
   ↓
Validar cada carácter
   ↓
¿Carácter inválido?
   ↓
    SI → Mostrar error → volver a solicitar
    NO → Continuar validación
   ↓
Fin validación
   ↓
Contar vocales
Contar consonantes
Contar espacios
   ↓
Mostrar resultados
   ↓
FIN

# 8 Casos de prueba formales
Casos válidos

Entra       Vocales     Consonantes     Espacios

Hola        2           2               0

Hola mundo  4           5               1

AEIOU       5           0               0

bcdfg       0           5               0

Casos inválidos
Entrada             motivo
hola123             números
hola!               Simbolo
mañana              ñ
café                tilde