#!/bin/bash
# Compila el traductor V1 de Cocodrilo
# La salida es: v1/traductor (ELF ejecutable)

DIR="$(cd "$(dirname "$0")" && pwd)"
BIN="$DIR/../bin"

"$BIN/fasm" "$DIR/traductor.fasm" "$DIR/traductor" 2>&1
echo "V1 compilado: $DIR/traductor"
