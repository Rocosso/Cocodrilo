# Ejemplos

## Hola Mundo

```
/ Hola Mundo en Cocodrilo
cadena MENSAJE = "Hola, Mundo!"
escribir @MENSAJE
salir A
```

## Contador

```
/ Contador del 1 al 5
mover A, 0
@inicio:
    sumar A, 1
    comparar A, 5
    saltar_si_no_igual @inicio
detener
```

## Tabla de Sumar

```
/ Tabla del 2
mover A, 2
mover B, 1
@fila:
    escribir @NUM
    sumar A, 2
    comparar B, 5
    sumar B, 1
    saltar_si_no_igual @fila
detener
cadena NUM = " "
```

## Entrada del Usuario

```
/ Leer un caracter y mostrarlo
cadena PREGUNTA = "Escribe algo: "
escribir @PREGUNTA
leer A, @INPUT
escribir @INPUT
salir A
@INPUT:
    mover A, 0
    detener
```

## Funciones

```
/ Programa con funcion
llamar @imprimir
saltar @fin

@imprimir:
    cadena HOLA = "Hola desde funcion!"
    escribir @HOLA
    detener

@fin:
    mover A, 1
    detener
```

## Suma de Dos Números

```
/ Suma dos valores
mover A, 10
mover B, 20
sumar A, B
/ A ahora contiene 30
detener
```
