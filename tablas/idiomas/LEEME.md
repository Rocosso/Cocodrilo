# Paquetes de idioma de Cocodrilo

Cada archivo JSON mapea las instrucciones, tipos, sufijos y palabras
clave de Cocodrilo a otro idioma.

## Formato

```json
{
  "meta": { "idioma": "...", "codigo": "es|en|ko", "descripcion": "..." },
  "instrucciones": { "comando_es": "traduccion" },
  "tipos": { "tipo_es": "traduccion" },
  "sufijos": { "sufijo_es": "traduccion" },
  "registros": ["A", "B", ...],
  "palabras_clave": { "clave_es": "traduccion" }
}
```

## Uso

El compilador acepta el flag `-l` para cargar un paquete:

```
traductor -l en entrada.ccdl salida.bin
```

Esto permite escribir codigo en cualquier idioma soportado:
- `mover A, 10` (espanol, por defecto)
- `move A, 10` (ingles, con -l en)
- `이동 A, 10` (coreano, con -l ko)

## Como agregar un idioma

1. Copiar `base_es.json` como `idioma.json`
2. Traducir los valores (no las claves)
3. Enviar un PR
