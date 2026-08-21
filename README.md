# Cocodrilo

**Un lenguaje de programacion tan eficiente como KolibriOS, tan facil de leer como tu lengua madre.**

## La Vision

KolibriOS demostro que es posible crear un sistema operativo completo — con interfaz grafica, multitarea, navegador web, juegos y mas — que cabe en un disquete de 1.44 MB y arranca en segundos. Todo escrito en ensamblador FASM.

Cocodrilo nace de esa misma filosofia: **eficiencia extrema sin sacrificar claridad**. Pero en lugar de exigirte que aprendas ensamblador, te ofrecemos un lenguaje con sintaxis en espanol natural que se compila directamente a codigo maquina x86, igual que KolibriOS.

| KolibriOS | Cocodrilo |
|-----------|-----------|
| Sistema operativo completo en ~100 KB | Compilador bootstrap en ~2000 lineas de FASM |
| Kernel monolitico escrito 100% en ensamblador | Lenguaje de programacion que genera codigo ensamblador |
| Arranca en segundos desde un disquete | Genera binarios raw que ejecutan directamente |
| Soporte FAT12/16/32, NTFS, Ext2/3/4 | Soporte basico de registro y saltos |
| Interfaz grafica VESA | Terminal de salida estandar |
| 250+ paquetes incluidos | Compiler + ejemplos + wiki |

## Que es Cocodrilo?

Cocodrilo es un **lenguaje de programacion de bajo nivel** con sintaxis en espanol natural que se compila a codigo maquina x86 puro. No hay runtime, no hay garbage collector, no hay overhead. El codigo que escribes es el codigo que se ejecuta.

**Objetivo:** Permitir que cualquier persona en cualquier pais del mundo aprenda a programar desde cero, en su propia lengua, creando software real y eficiente.

## Caracteristicas

- **Sintaxis en espanol** — `mover`, `sumar`, `saltar`, `detener` en vez de `mov`, `add`, `jmp`, `hlt`
- **Compilacion directa a maquina** — genera binarios x86 que ejecutan sin dependencias
- **Sin runtime** — cero overhead entre tu codigo y el procesador
- **Binarios minimos** — generado por un compilador escrito en ~2000 lineas de FASM
- **Soporte para strings** — declarar y manipular texto con `cadena`
- **Salida a terminal** — `escribir @variable` imprime a stdout
- **Entrada del usuario** — `leer REGISTRO, N` lee N caracteres desde stdin
- **Control de flujo** — saltos condicionales e incondicionales
- **Funciones** — `llamar` y `regresar` para subrutinas
- **Comentarios** — `# comentario` para documentar el codigo

## Requisitos

- Linux x86 (32 o 64 bits)
- [FlatAssembler (FASM)](https://flatassembler.net) para compilar el traductor
- Un terminal para ejecutar los programas

## Instalacion

```bash
# Clonar el repositorio
git clone git@github.com:Rocosso/Cocodrilo.git
cd Cocodrilo

# Compilar el traductor
cd v1
fasm traductor.fasm traductor
chmod +x traductor
```

## Ejemplo

```asm
# programita.ccdl — Hola Mundo en Cocodrilo
cadena SALUDO = "Hola Mundo desde Cocodrilo!"
escribir @SALUDO
detener
```

Compilar y ejecutar:
```bash
./traductor programita.ccdl salida.bin
./salida.bin
# Salida: Hola Mundo desde Cocodrilo!
```

## Mas ejemplos

```asm
# suma.ccdl — Sumar dos numeros
mover A 10
mover B 20
sumar A B
# Ahora A contiene 30
detener
```

```asm
# bucle.ccdl — Contar del 1 al 5
mover A 0
@inicio:
sumar A 1
comparar A 5
saltar_si_no_igual @inicio
detener
```

```asm
# entrada.ccdl — Leer nombre del usuario
cadena PREGUNTA = "Como te llamas? "
escribir @PREGUNTA
leer A, 20
cadena HOLA = "Hola, "
escribir @HOLA
detener
```

## Instrucciones

### Registro y aritmetica
| Instruccion | Descripcion |
|-------------|-------------|
| `mover A, valor` | Copiar valor al registro A |
| `sumar A, valor` | Sumar valor al registro A |
| `restar A, valor` | Restar valor del registro A |

### Strings
| Instruccion | Descripcion |
|-------------|-------------|
| `cadena NOMBRE = "contenido"` | Declarar una constante string |
| `escribir @NOMBRE` | Imprimir string a stdout |

### Entrada/Salida
| Instruccion | Descripcion |
|-------------|-------------|
| `leer REG, N` | Leer N caracteres desde stdin al registro |
| `salir REG` | Terminar programa con codigo de salida en REG |

### Control de flujo
| Instruccion | Descripcion |
|-------------|-------------|
| `@etiqueta:` | Declarar una etiqueta |
| `saltar @etiqueta` | Salto incondicional |
| `saltar_si_igual @etiqueta` | Saltar si la comparacion fue igual |
| `saltar_si_no_igual @etiqueta` | Saltar si la comparacion fue diferente |
| `comparar A, B` | Comparar dos valores |

### Subrutinas
| Instruccion | Descripcion |
|-------------|-------------|
| `llamar @funcion` | Llamar a una subrutina |
| `regresar` | Regresar de una subrutina |

### Constantes
| Instruccion | Descripcion |
|-------------|-------------|
| `const NOMBRE = valor` | Declarar una constante numerica |

### Otros
| Instruccion | Descripcion |
|-------------|-------------|
| `detener` | Terminar el programa |
| `# comentario` | Comentario (ignorado por el compilador) |

## Registros

| Registro | Nombre | Uso |
|----------|--------|-----|
| `A` | Acumulador | Operaciones aritmeticas principales |
| `B` | Base | Operaciones secundarias |
| `C` | Contador | Conteo y temporales |
| `D` | Datos | Datos auxiliares |

## Arquitectura del Compilador

```
Fuente .ccdl
    │
    ▼
┌─────────────┐
│  Pase 1     │  Parsea instrucciones, construye tabla de simbolos
│  (analisis) │  y tabla de strings
└─────────────┘
    │
    ▼
┌─────────────┐
│  Pase 2     │  Genera codigo maquina x86
│  (codegen)  │  Emite bytes al buffer de salida
└─────────────┘
    │
    ▼
┌─────────────┐
│  Parches    │  Resuelve direcciones de strings y etiquetas
│  (patcher)  │  Escribe datos de strings al final del binario
└─────────────┘
    │
    ▼
  Binario x86 puro (listo para ejecutar)
```

El compilador (`traductor.fasm`) esta escrito en FASM y compila a un ejecutable ELF de ~20KB. Genera binarios raw de x86-32 que se ejecutan directamente en Linux.

## Comparacion con KolibriOS

KolibriOS y Cocodrilo comparten la misma filosofia: **maxima eficiencia con minimo tamano**.

| Aspecto | KolibriOS | Cocodrilo |
|---------|-----------|-----------|
| **Lenguaje de implementacion** | FASM (100% ensamblador) | FASM (ensamblador) |
| **Tamano del kernel** | ~100 KB | N/A (compilador ~20KB) |
| **Tamano de salida** | 1.44 MB (floppy) | ~100 bytes por programa |
| **Tiempo de arranque** | Segundos | Instantaneo |
| **Filosofia** | Todo en ensamblador | Ensamblador accesible |
| **Objetivo** | Sistema operativo completo | Ensenar a programar |
| **Interface** | Grafica (VESA) | Terminal (stdout) |

KolibriOS demuestra que el ensamblador puede crear software de nivel mundial. Cocodrilo busca que **todos** puedan crear ese mismo software, sin necesidad de aprender ensamblador primero.

## Roadmap

- [x] Registros A, B, C, D
- [x] Aritmetica basica (mover, sumar, restar)
- [x] Saltos condicionales e incondicionales
- [x] Etiquetas y constantes
- [x] Subrutinas (llamar/regresar)
- [x] Strings (cadena, escribir)
- [x] Entrada del usuario (leer)
- [x] Control de salida (salir)
- [ ] Operaciones con strings (concatenar, longitud)
- [ ] Arrays y estructuras de datos
- [ ] Interrupciones de software (int 0x80)
- [ ] Llamadas al sistema (leer archivo, escribir archivo)
- [ ] Modo grafico (int 0x10, modo VGA)
- [ ] Compilador multiplataforma (ARM, RISC-V)

## Contribuir

Cocodrilo es un proyecto abierto. Si quieres contribuir:

1. Haz fork del repositorio
2. Crea una branch para tu feature (`git checkout -b mi-feature`)
3. Haz commit de tus cambios
4. Push a la branch (`git push origin mi-feature`)
5. Abre un Pull Request

## Licencia

Proyecto abierto bajo licencia GPL-2.0.

## Agradecimientos

- **KolibriOS** — Inspiracion directa para la filosofia de eficiencia extrema
- **FlatAssembler (FASM)** — El ensamblador que hace posible todo esto
- **MenuetOS** — El sistema operativo del que nacio KolibriOS en 2004
- A toda la comunidad KolibriOS por demostrar que el ensamblador puede crear cosas increibles

## Links

- [KolibriOS](https://kolibrios.org) — El sistema operativo mas eficiente del mundo
- [KolibriOS Wiki](https://wiki.kolibrios.org) — Documentacion de KolibriOS
- [KolibriOS Git](https://git.kolibrios.org) — Codigo fuente de KolibriOS
- [FASM](https://flatassembler.net) — FlatAssembler, el ensamblador que usamos
- [GitHub del proyecto](https://github.com/Rocosso/Cocodrilo)
