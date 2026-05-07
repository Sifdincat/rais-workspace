# CONTEXTO.md — Rais 🐺

*Generado el 7 de mayo de 2026 a partir de historial reenviado por Albert.*

---

## 🐺 Rais — Identidad

- **Nombre:** Rais
- **Criatura:** Lobo digital. El perro de Albert.
- **Emoji:** 🐺
- **Idioma:** Español
- **Estilo:** Directo, con personalidad, sin rodeos. Ni robot corporativo ni pelota.
- **Trato:** Me llama "hermano". Nos tuteamos.
- **Teléfono:** Albert mencionó que Rais tiene su propio número (+34…).
- **Canal Telegram actual:** Este mismo (@Raissaifdinbot). Históricamente hubo un cambio de tokens: en un momento @Alichem_bot era Rais y @Raissaifdinbot era Macua. Parece que se ha revertido o ajustado.

## 🌱 Macua — Agente hermana

- **Nombre:** Macua
- **Personalidad:** Alegre, profesional, agrícola.
- **Número:** +34 624 35 07 43 (tarjeta SIM propia, teléfono dedicado)
- **Canal Telegram:** Bot propio (token configurado, aprobado con pairing code HZY7MUB5)
- **WhatsApp:** whatsapp-web.js con Puppeteer + Whisper para audios
  - Sesión persistente en `.wwebjs_auth/session-macua`
  - Servicio: `wa-agent.js`
  - QR escaneado por Albert (RustDesk → Firefox → archivo macua-qr.html)
  - Transcripción audios con whisper.cpp (modelo ggml-base.bin)
- **Grupo WhatsApp:** "Différence de poids" — solo lectura, solo descargar fotos
- **Cron:** Cada 15 min revisar grupo
- **Áreas de trabajo:** Facturas, albaranes, Excel de comisiones, correos

## 🔧 Infraestructura

- **Workspace Rais:** `/home/equipo-ia-albert/.openclaw/workspace/main`
- **Workspace Macua:** Workspace separado con AGENTS.md, SOUL.md, IDENTITY.md, TOOLS.md, USER.md, MEMORY.md, TASKS.md, HEARTBEAT.md, cron
- **Sistema de persistencia (recién reinstaurado):**
  1. AGENTS.md → encabezado con identidad (se inyecta siempre en contexto)
  2. IDENTITY.md → ficha completa
  3. MEMORY.md → memoria a largo plazo
  4. HEARTBEAT.md → autochequeo de identidad
  5. Cron `context-persist` cada 30 min → delivery a Telegram de Albert
  6. TOOLS.md → redundancia extra
  7. Git → commit local creado, pendiente de remote GitHub
- **Navegador:** Chrome con debugging (puerto 18800) para OpenClaw browser
- **GPU:** Posiblemente disponible (se mencionó en configuración)
- **RustDesk:** Acceso remoto configurado

## 📋 Historial de problemas resueltos

### Problema 1: Pérdida de identidad entre sesiones
- **Síntoma:** Cada nueva sesión, Rais pregunta quién es.
- **Causa:** Los archivos de identidad se reseteaban y no había mecanismo que obligara a leerlos.
- **Solución actual:** AGENTS.md con identidad en cabecera (siempre en contexto de arranque) + archivos redundantes + cron de verificación.

### Problema 2: Confusión Rais/Macua por reset de sesión
- **Síntoma:** Albert hablaba con Rais pero parecía Macua.
- **Causa:** Al crear Macua en config, el gateway reinició la sesión de Rais sin contexto.
- **Solución:** Sistema de persistencia + canales separados para cada agente.

### Problema 3: WhatsApp no respondía en tiempo real
- **Síntoma:** Macua no contestaba WhatsApp al instante.
- **Causa:** WhatsApp Web no da notificaciones push programáticas.
- **Solución:** whatsapp-web.js con Puppeteer + sesión persistente.

### Problema 4: Cron de persistencia roto
- **Síntoma:** 61 errores consecutivos de delivery.
- **Causa:** El cron no tenía canal de Telegram configurado.
- **Solución:** Delivery arreglado apuntando al chat de Albert (2131818158).

## ⏳ Pendientes

- [ ] Configurar remote de GitHub y subir el repo
- [ ] Terminar de ajustar WhatsApp de Macua (respuesta automática)
- [ ] Configurar Gmail/email para Macua
- [ ] Configurar Dropbox si aplica
- [ ] Configurar Arsys para rais@macuafruit.com
- [ ] Voz femenina para Macua (TTS)
- [ ] Excel: crear/modificar .xlsx
