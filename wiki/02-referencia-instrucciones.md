# Referencia de Instrucciones

## Movimiento de Datos

### mover
Carga un valor inmediato en un registro.

```
mover A, 10      / A = 10
mover B, 0xFF    / B = 255
```

## Operaciones Aritméticas

### sumar
Suma un valor inmediato al registro.

```
mover A, 10
sumar A, 5       / A = 15
```

### restar
Resta un valor inmediato del registro.

```
mover A, 10
restar A, 3      / A = 7
```

## Comparación y Saltos

### comparar
Compara un registro con un valor inmediato (actualiza flags).

```
mover A, 10
comparar A, 10   / Flags: ZF=1
```

### saltar
Salta incondicionalmente a una etiqueta.

```
saltar @inicio
```

### saltar_si_igual
Salta si la comparación anterior fue igual (ZF=1).

```
comparar A, 10
saltar_si_igual @iguales
```

### saltar_si_no_igual
Salta si la comparación anterior no fue igual (ZF=0).

```
comparar A, 10
saltar_si_no_igual @diferentes
```

## Entrada/Salida

### escribir
Imprime un string en la salida estándar (stdout).

```
cadena SALUDO = "Hola, Mundo!"
escribir @SALUDO
```

### leer
Lee datos de la entrada estándar (stdin) a una variable.

```
leer A, @INPUT
```

### salir
Termina el programa con un código de salida.

```
salir A          / Salir con código en A
```

## Constantes

### cadena
Define una constante de tipo string.

```
cadena NOMBRE = "valor"
cadena VACIO = ""
```

Soporta secuencias de escape:
- `\n` - Salto de línea

## Subrutinas

### llamar
Llama a una subrutina (función).

```
llamar @mi_funcion
```

### etiquetas
Las etiquetas marcan puntos de entrada.

```
@mi_funcion:
    mover A, 1
    detener
```

## Control

### detener
Detiene la ejecución del programa.

```
detener
```
