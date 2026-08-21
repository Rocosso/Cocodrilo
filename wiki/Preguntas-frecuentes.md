# Preguntas Frecuentes

## ¿Por qué Cocodrilo usa español?

Cocodrilo fue creado para que niños de todo el mundo puedan aprender a programar en su idioma nativo, preservando la diversidad lingüística mientras aprenden tecnología.

## ¿Qué tan eficiente es?

Cocodrilo genera código máquina x86 real, igual que C o C++. No hay intérprete ni virtual machine, por lo que es tan rápido como el código ensamblador puro.

## ¿Puedo usar Cocodrilo en producción?

Cocodrilo es un proyecto educativo. Para aplicaciones de producción, se recomienda usar lenguajes establecidos como C, Python o Rust.

## ¿Qué extensiones de archivo usa?

Los archivos de código fuente usan la extensión `.ccdl` (Cocodrilo).

## ¿Cómo defino strings?

Usa la instrucción `cadena`:

```
cadena MI_TEXTO = "Hola Mundo"
escribir @MI_TEXTO
```

## ¿Puedo usar acentos y ñ?

Actualmente el compilador usa caracteres ASCII. Los acentos y ñ no están soportados en nombres de variables ni strings.

## ¿Cómo compilo mi programa?

```bash
v1/traductor mi_programa.ccdl
./mi_programa
```

## ¿Qué registros están disponibles?

- `A` (al) - Registro principal
- `B` (bl) - Registro secundario
- `C` (cl) - Registro temporal
- `D` (dl) - Registro temporal

## ¿Cómo creo una función?

Usa etiquetas con `@`:

```
llamar @mi_funcion
saltar @fin

@mi_funcion:
    mover A, 1
    detener

@fin:
    detener
```

## ¿Qué instrucciones de E/S existen?

- `escribir @str` - Imprime en stdout
- `leer A, @var` - Lee de stdin
- `salir A` - Termina el programa
