#!/bin/bash

# Diretório de origem dos logs do Pentaho Tomcat
LOGS_SOURCE="/opt/pentaho-server/tomcat/logs"

# Diretório de destino dos logs no volume compartilhado (sharedFolder)
LOGS_DEST="/opt/sharedFolder/logs"

# Verifica se o diretório de destino existe, caso contrário cria
if [ ! -d "$LOGS_DEST" ]; then
  mkdir -p "$LOGS_DEST"
fi

# Copia os logs para o diretório compartilhado
cp -u $LOGS_SOURCE/* $LOGS_DEST/