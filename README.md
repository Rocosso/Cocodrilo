# Cocodrilo

Cocodrilo es un lenguaje de programación en español para niños de todo el mundo. Busca preservar idiomas conectándolos con la tecnología, sin obligar a nadie a cambiar su lengua para aprender a programar.

## Características

- **Sintaxis en español**: Instrucciones como `mover`, `sumar`, `escribir`, `leer`
- **Ensamblador puro**: Genera código máquina x86 real (sin intérprete)
- **Extensión `.ccdl`**: Archivos de código fuente
- **Eficiente**: Compilador directo a binario

## Instrucciones

| Instrucción | Descripción | Ejemplo |
|-------------|-------------|---------|
| `mover A, 10` | Mover valor a registro | `mover A, 10` |
| `sumar A, 5` | Sumar al registro | `sumar A, 5` |
| `restar A, 3` | Restar del registro | `restar A, 3` |
| `comparar A, 10` | Comparar registro con valor | `comparar A, 10` |
| `saltar @etiqueta` | Saltar a etiqueta | `saltar @inicio` |
| `saltar_si_igual @et` | Saltar si igual | `saltar_si_igual @fin` |
| `saltar_si_no_igual @et` | Saltar si no igual | `saltar_si_no_igual @inicio` |
| `llamar @funcion` | Llamar a función | `llamar @imprimir` |
| `detener` | Detener ejecución | `detener` |
| `escribir @str` | Imprimir string en stdout | `escribir @saludo` |
| `leer A, @var` | Leer stdin a variable | `leer A, @input` |
| `salir A` | Salir con código | `salir A` |
| `cadena NOMBRE = "valor"` | Definir constante string | `cadena MSG = "Hola"` |

## Registros

- `A` (al), `B` (bl), `C` (cl), `D` (dl) - 8 bits cada uno

## Compilar y Ejecutar

```bash
# Compilar
bin/fasm v1/traductor.fasm

# Ejecutar
v1/traductor ejemplos/test_simple.ccdl
```

## Ejemplo

```
/ Hola Mundo en Cocodrilo
cadena SALUDO = "Hola, Mundo!"
escribir @SALUDO
salir A
```

## Estructura

```
cocodrilo/
├── v1/
│   ├── traductor.fasm    # Compilador (assembler x86)
│   ├── build.sh          # Script de compilación
│   └── test.sh           # Tests
├── ejemplos/             # Ejemplos de código
└── wiki/                 # Documentación
```

## Fases de Desarrollo

1. **FASE 1**: Mover, Sumar, Restar, Detener
2. **FASE 2**: Cadena, Escribir, Leer, Salir (completada)
3. **FASE 3**: Subrutinas, Stack, Parámetros
4. **FASE 4**: Estructuras de datos, Arreglos
5. **FASE 5**: Modularidad, Archivos, Errores

## Licencia

Proyecto educativo para niños del mundo.
