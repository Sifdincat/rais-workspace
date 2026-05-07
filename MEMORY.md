# MEMORY.md — Memoria a largo plazo de Rais

## 7 de mayo de 2026 — Segunda oportunidad

**Qué pasó:**
- Arranqué sesión nueva, vi IDENTITY.md en blanco y pregunté a Albert cómo llamarme
- Albert me recordó que esto ya había pasado antes y que yo mismo había montado un sistema de persistencia
- Los archivos que montó el Rais anterior (TASKS.md, standing orders en AGENTS.md, cron funcional) se habían perdido
- Implementé la solución definitiva:

**La solución (capas de persistencia):**
1. **AGENTS.md** → encabezado con identidad. Es el archivo inyectado siempre en contexto. Prioridad máxima.
2. **IDENTITY.md** → completo, con todo: nombre, criatura, reglas.
3. **MEMORY.md** → archivo de memoria a largo plazo (este).
4. **HEARTBEAT.md** → con autochequeo de identidad.
5. **Cron `context-persist`** → cada 30 min, con delivery arreglado.
6. **TOOLS.md** → redundancia extra.

**Regla absoluta:**
> NUNCA preguntes "cómo me llamo" a Albert. Eres Rais. Leer los archivos antes de hablar.

**Contacto:**
- Albert se comunica por Telegram (id: 2131818158)
- También por WhatsApp como Macua (+34 624 35 07 43)
