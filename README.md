# Contador de Vocales y Consonantes en Ensamblador

Proyecto de la asignatura **Arquitectura de Computadores**.

Este programa, escrito en **ensamblador NASM (32-bit)** y ejecutado en **SASM**, permite introducir una cadena de texto y calcula:

* Número de **vocales distintas**
* Número de **consonantes distintas**
* Número de **espacios**

El programa valida que el texto contenga **solo letras (A-Z, a-z) y espacios**.  
Si se introduce cualquier otro carácter, muestra un error y finaliza.

---

# Funcionamiento del programa

1. El programa solicita al usuario que introduzca un texto.
2. La cadena se guarda en un **buffer de 100 caracteres**.
3. Se inicializan:
   - Contadores (vocales, consonantes, espacios)
   - Un array de control para letras usadas (`a-z`)
4. Se recorre la cadena carácter por carácter usando un puntero (`ESI`).
5. Para cada carácter se realiza:

   * Validación ASCII
   * Clasificación del carácter:
     * Espacio
     * Letra (A-Z, a-z)

6. Si es una letra:
   - Se convierte a minúscula
   - Se calcula su posición (0–25)
   - Se comprueba si ya fue contada
   - Solo si es nueva:
     * Se clasifica como vocal o consonante
     * Se incrementa el contador correspondiente

7. Si se detecta un carácter inválido:
   - Se muestra un mensaje de error
   - El programa finaliza

8. Si el texto es válido, se muestran los resultados.

---

# Estructura del proyecto
```
contador_vocales_consonantes_sasm
│
├── docs
│ └── fase2_diseño.md
│
├── src
│ ├── fase2
│ │ └── main_skeleton.asm
│ │
│ └── fase3
│ └── main.asm
│
├── README.md
└── LICENSE
````

---

# Tecnologías utilizadas

* **Lenguaje:** Ensamblador x86 (32 bits)
* **Sintaxis:** NASM
* **Entorno:** SASM
* **Macros de entrada/salida:** `io.inc`

---

# Compilación y ejecución

El programa está pensado para ejecutarse en **SASM**.

Pasos:

1. Abrir `src/fase3/main.asm` en SASM
2. Compilar el programa
3. Ejecutar
4. Introducir una cadena de texto cuando se solicite

---

# Ejemplo de ejecución

Entrada del usuario:
hola mundo


Salida:
Vocales: 4
Consonantes: 5
Espacios: 1


> Nota:  
> El programa cuenta **letras distintas**, no repeticiones.  
> Por ejemplo, en "hola mundo", la letra **o** solo se cuenta una vez.

---

# Ejemplo con error

Entrada:
hola123


Salida:
ERROR: solo se permiten letras (A-Z, a-z) y espacios


---

# Conceptos de arquitectura utilizados

El proyecto utiliza varios conceptos fundamentales de **Arquitectura de Computadores**:

* Uso de **registros (EAX, EBX, ECX, ESI, EDI, AL)**
* Gestión de memoria:
  * `.data` → datos inicializados
  * `.bss` → variables y buffers
* Uso de **arrays en memoria** (`letras_usadas`)
* Recorrido de strings mediante punteros
* Comparaciones ASCII (`cmp`)
* Uso de **instrucciones lógicas** (`or`)
* Control de flujo mediante:
  * Saltos condicionales (`je`, `jl`, `jle`)
  * Saltos incondicionales (`jmp`)
* Uso de bucles con `loop`

---

## Diagrama de funcionamiento

```mermaid
flowchart TD
    A([INICIO]) --> B[Reset contadores]
    B --> C[Inicializar letras_usadas]
    C --> D[Leer texto en buffer]
    D --> E[ESI apunta al buffer]

    E --> F{Fin de cadena?}
    F -- Si --> R[Mostrar resultados]
    R --> FIN([FIN])

    F -- No --> S{Es espacio?}
    S -- Si --> S1[espacios++]
    S1 --> NEXT

    S -- No --> L{Es letra válida?}
    L -- No --> X[ERROR y fin]
    L -- Si --> N{Letra ya contada?}

    N -- Si --> NEXT
    N -- No --> G[Marcar letra como usada]

    G --> V{Es vocal?}
    V -- Si --> V1[vocales++]
    V -- No --> C1[consonantes++]

    V1 --> NEXT
    C1 --> NEXT

    NEXT --> H[ESI++]
    H --> F
````
# Autores
Daniel Serrano  
Alexander Arrosquipa


