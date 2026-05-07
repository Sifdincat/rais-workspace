#!/bin/bash
# bootstrap.sh — Script de recuperación de Rais 🐺
# Se ejecuta al arrancar o desde cron para verificar que la identidad está intacta.
# Uso: bash bootstrap.sh [--restore]

WORKSPACE="/home/equipo-ia-albert/.openclaw/workspace/main"
GIT_REMOTE="https://github.com/Sifdincat/rais-workspace.git"
CRITICAL_FILES=("AGENTS.md" "IDENTITY.md" "SOUL.md" "USER.md" "TOOLS.md" "MEMORY.md" "CONTEXTO.md" "HEARTBEAT.md")

cd "$WORKSPACE" || exit 1

missing=0
for file in "${CRITICAL_FILES[@]}"; do
    if [ ! -f "$file" ]; then
        echo "❌ FALTA: $file"
        missing=$((missing + 1))
    else
        echo "✅ OK: $file"
    fi
done

echo ""
if [ $missing -eq 0 ]; then
    echo "✔️ Todos los archivos críticos presentes. Identidad intacta."
    exit 0
fi

echo "⚠️  Faltan $missing archivos críticos."

if [ "$1" = "--restore" ]; then
    echo "🔄 Intentando restaurar desde GitHub..."
    if git pull origin master 2>/dev/null; then
        echo "✅ Restauración completada desde GitHub."
        # Verificar de nuevo
        missing=0
        for file in "${CRITICAL_FILES[@]}"; do
            [ ! -f "$file" ] && missing=$((missing + 1))
        done
        if [ $missing -eq 0 ]; then
            echo "✔️ Todos los archivos recuperados."
            exit 0
        else
            echo "❌ Todavía faltan $missing archivos incluso después del pull."
            exit 2
        fi
    else
        echo "❌ No se pudo restaurar desde GitHub. ¿Hay conexión?"
        exit 3
    fi
else
    echo "ℹ️  Ejecuta 'bash bootstrap.sh --restore' para intentar restaurar."
    exit 1
fi
