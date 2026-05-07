# 🏗️ AGENT_TEMPLATE.md — Plantilla para crear nuevos agentes blindados

*Creada por Rais 🐺 — 7 de mayo de 2026*
*Usa esta plantilla cada vez que crees un agente nuevo para que herede la misma solidez que el agente principal.*

---

## 📋 Checklist de creación

### 1. Configuración en OpenClaw

Añadir en `~/.openclaw/openclaw.json` dentro de `agents.list`:

```json
{
    "id": "nombre-agente",
    "name": "Nombre del Agente",
    "workspace": "/home/equipo-ia-albert/.openclaw/agents/nombre-agente/workspace",
    "identity": {
        "name": "Nombre",
        "theme": "descripción de personalidad",
        "emoji": "🎯"
    },
    "model": "deepseek/deepseek-v4-flash"
}
```

### 2. Archivos críticos (obligatorios)

| Archivo | Propósito |
|---------|-----------|
| `AGENTS.md` | Encabezado con identidad (se inyecta siempre en contexto) |
| `SOUL.md` | Personalidad, estilo, reglas de comportamiento |
| `IDENTITY.md` | Ficha completa: nombre, criatura, creador, reglas clave |
| `USER.md` | Información del humano |
| `TOOLS.md` | Notas locales, contactos, SSH, etc. |
| `MEMORY.md` | Memoria a largo plazo |
| `HEARTBEAT.md` | Autochequeo periódico |
| `TASKS.md` | Tareas activas (opcional según agente) |

### 3. Persistencia (cada agente)

- **Cron cada 30 min** con delivery al chat correspondiente
- **Git init + remote** en el workspace del agente
- **Archivo `bootstrap.sh`** para recuperación de emergencia

### 4. Canales

Vincular en `openclaw.json` → `bindings`:

```json
{
    "agentId": "nombre-agente",
    "match": {
        "channel": "telegram",
        "accountId": "id-cuenta"
    }
}
```

---

## 🔁 Ciclo de vida del agente

```
Crear config → Workspace → Archivos críticos → Git → Canales → Prueba → Operativo
                     ↓                        ↓
              bootstrap.sh              Cron persistencia
```

---

*Esta plantilla es un documento vivo. Actualízala cuando descubras mejoras.*
