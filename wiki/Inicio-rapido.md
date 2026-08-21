# Inicio Rápido

## Instalación

Cocodrilo necesita un ensamblador FASM para compilarse.

```bash
# Clonar repositorio
git clone git@github.com:Rocosso/Cocodrilo.git
cd Cocodrilo

# Compilar el compilador
./v1/build.sh
```

## Tu Primer Programa

Crea un archivo `hola.ccdl`:

```
/ Hola Mundo en Cocodrilo
cadena MENSAJE = "Hola, Mundo!"
escribir @MENSAJE
salir A
```

Ejecuta:

```bash
v1/traductor hola.ccdl
./hola
```

## Sintaxis Básica

- Las líneas que empiezan con `/` son comentarios
- Las instrucciones van una por línea
- Las etiquetas empiezan con `@`
- Los strings se definen con `cadena`

## Registros

Cocodrilo usa 4 registros de 8 bits:

- `A` - Registro principal
- `B` - Registro secundario
- `C` - Registro temporal
- `D` - Registro temporal

## Operaciones

```
mover A, 10      / Cargar valor
sumar A, 5       / Sumar
restar A, 3      / Restar
comparar A, 10   / Comparar
```
