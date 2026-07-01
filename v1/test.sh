#!/bin/bash
# Test runner para V1
# Compila y ejecuta tests de todas las instrucciones

DIR="$(cd "$(dirname "$0")" && pwd)"
V1="$DIR/traductor"
EJEM="$(cd "$DIR/../ejemplos" && pwd)"
TMP="/tmp/t_cocodrilo.bin"
PASS=0
FAIL=0

test_inst() {
    local name="$1"
    local src="$2"
    printf "$src" > /tmp/t.ccdl
    if $V1 /tmp/t.ccdl $TMP 2>/dev/null; then
        echo "  PASS: $name"
        PASS=$((PASS+1))
    else
        echo "  FAIL: $name"
        FAIL=$((FAIL+1))
    fi
}

test_err() {
    local name="$1"
    local src="$2"
    printf "$src" > /tmp/t.ccdl
    if ! $V1 /tmp/t.ccdl $TMP 2>/dev/null; then
        echo "  PASS: $name (error detectado)"
        PASS=$((PASS+1))
    else
        echo "  FAIL: $name (debio dar error)"
        FAIL=$((FAIL+1))
    fi
}

echo "=== COCODRILO V1 - TEST SUITE ==="
echo

test_inst "detener"          "detener\n"
test_inst "mover imm"        "mover A 10\nmover B 20\nmover C 30\nmover D 40\ndetener\n"
test_inst "mover reg,reg"    "mover A 10\nmover B A\nmover C B\nmover D C\ndetener\n"
test_inst "sumar/restar"     "mover A 10\nsumar A 5\nrestar A 3\ndetener\n"
test_inst "comparar"         "@l\nmover A 10\ncomparar A A\nsaltar_si_igual @l\ndetener\n"
test_inst "saltar"           "@l\nsaltar @l\n"
test_inst "saltar si igual"  "@l\nsaltar_si_igual @l\n"
test_inst "saltar si no igual"  "@l\nsaltar_si_no_igual @l\n"
test_inst "llamar"           "@fn\ndetener\nllamar @fn\n"
test_inst "const"            "const X = 99\nmover A X\ndetener\n"
test_inst "comentario #"     "# prueba\nmover A 10\ndetener\n"
test_inst "comentario inline"  "mover A 10 # inline\ndetener\n"
test_inst "comentario const"  "const X = 5 # valor\nmover A X\ndetener\n"

echo
echo "--- Errores ---"
test_err "sintaxis"          "mover A 10\ninvalido\n"
test_err "etiq no encontrada"  "saltar @nonexist\ndetener\n"

echo
if $V1 $EJEM/test_v1.ccdl $TMP 2>/dev/null; then
    echo "  PASS: test_v1.ccdl INTEGRACION"
    PASS=$((PASS+1))
else
    echo "  FAIL: test_v1.ccdl INTEGRACION"
    FAIL=$((FAIL+1))
fi

echo
echo "=== RESULTADOS: $PASS pass, $FAIL fail ==="
echo
[ $FAIL -eq 0 ] && echo "TODO OK!" || echo "HAY FALLOS"
