# Cocodrilo

Cocodrilo es un lenguaje de programacion ultra-liviano que combina la
legibilidad de Python con la velocidad de Assembler y la seguridad de Rust.
Traduce directamente a codigo maquina (sin LLVM, sin runtime, sin GC).

## Filosofia

- Ninos de todo el mundo aprendiendo a programar en su lengua materna
- Preservar idiomas vinculandolos a la tecnologia
- Eficiencia maxima: cada instruccion = 1 a 6 bytes de codigo maquina
- Sin capas intermedias, control total del hardware
- 100% software libre (Apache 2.0)
- Auto-bootstrapping: el compilador se escribe en Cocodrilo mismo
- Multi-idioma: paquetes de traduccion para programar en cualquier idioma

## Tipos de datos

| Tipo | Tamano | Sufijo |
|------|--------|--------|
| octeto | 8 bits | `.o` |
| palabra | 16 bits | `.p` |
| doble_palabra | 32 bits | `.dp` |
| cuadruple_palabra | 64 bits | `.cp` |

## Registros

A, B, C, D, E, F, G, H (proposito general), SP (puntero de pila), IP (puntero de instruccion).

## Instrucciones en espanol

### Movimiento y memoria
| Instruccion | Descripcion | Ejemplo |
|-------------|-------------|---------|
| `mover` dst, src | dst = src | `mover A, 42` |
| `leer` dst, [src] | Cargar desde memoria | `leer A, [B]` |
| `escribir` [dst], src | Guardar a memoria | `escribir [A], B` |

### Aritmeticas
| Instruccion | Descripcion | Ejemplo |
|-------------|-------------|---------|
| `sumar` dst, src | dst += src | `sumar A, 5` |
| `restar` dst, src | dst -= src | `restar A, 3` |

### Logicas bitwise
| Instruccion | Descripcion | Ejemplo |
|-------------|-------------|---------|
| `y` dst, src | dst &= src (AND) | `y A, B` |
| `o` dst, src | dst \|= src (OR) | `o A, B` |
| `o_exclusivo` dst, src | dst ^= src (XOR) | `o_exclusivo A, B` |
| `no` dst | dst = ~dst (NOT) | `no A` |

### Comparacion
| Instruccion | Descripcion | Ejemplo |
|-------------|-------------|---------|
| `comparar` a, b | Compara a con b (establece banderas) | `comparar A, B` |

### Saltos (control de flujo)
| Instruccion | Descripcion |
|-------------|-------------|
| `saltar` @etiqueta | Salto incondicional |
| `saltar_si_igual` @etiqueta | Salta si la comparacion fue igual |
| `saltar_si_no_igual` @etiqueta | Salta si la comparacion fue distinta |
| `saltar_si_mayor` @etiqueta | Salta si dst > src |
| `saltar_si_menor` @etiqueta | Salta si dst < src |
| `saltar_si_mayor_igual` @etiqueta | Salta si dst >= src |
| `saltar_si_menor_igual` @etiqueta | Salta si dst <= src |

### Pila
| Instruccion | Descripcion | Equivalente |
|-------------|-------------|-------------|
| `apilar` src | Colocar en la pila | push |
| `desapilar` dst | Sacar de la pila | pop |

### Llamadas
| Instruccion | Descripcion | Equivalente |
|-------------|-------------|-------------|
| `llamar` @funcion | Llama a una subrutina | call |
| `retornar` | Regresa de la subrutina | ret |

### Sistema
| Instruccion | Descripcion | Equivalente |
|-------------|-------------|-------------|
| `detener` | Detiene la ejecucion | hlt |
| `retraso_ciclos` n | Espera n ciclos de reloj | delay |

## Paquetes de idioma

Cocodrilo permite traducir todas sus palabras clave a cualquier idioma.
Los paquetes se almacenan en `tablas/idiomas/` en formato JSON.

Uso: `traductor -l en entrada.ccdl salida.bin`

Idiomas disponibles: es (espanol, por defecto), en (ingles), ko (coreano).

## Sintaxis

- Indentacion con 4 espacios (como Python)
- Comentarios con //
- Etiquetas con @nombre
- Constantes con `const NOMBRE = valor`
- Archivos con extension .ccdl

## Extension de archivo

`.ccdl` — iniciales de **CO**-**CA**-**DRI**-**LO**

## Licencia

Apache 2.0
