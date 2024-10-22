# **Logs Pentaho Dev Server 🛠️**

Guia rápido para extrair log do funcionamento.

## **Passo a Passo para vizualização do log**

### 1. Visualizar o README.md
- Abra o README.md no VSCode e visualize com:
  - **Windows/Linux**: `Ctrl + Shift + V`
  - **Mac**: `Cmd + Shift + V`

### 2. Start crontab
  
```bash
service cron start
```

### 3. Log

```bash
tail -f sharedFolder/logs/catalina.out
```
