#!/bin/bash

# obtem o diretorio onde o script está localizado
SCRIPT_DIR=$(dirname "$(realpath "$0")")
BACKUP_DIR="${SCRIPT_DIR}/backup"

#Configuração do banco
DB_NAME="projeto_esig"
DB_USER="postgres"
DB_HOST="localhost"
DB_PORT="5432"
TIMESTAMP=$(date +"%Y%m%d%H%M%S")
BACKUP_FILE="${BACKUP_DIR}/${DB_NAME}_backup_${TIMESTAMP}.SQL"

# Cria o diretorio de backup (Se não houver)
mkdir -p "${BACKUP_DIR}"

# Cria o dump do DB
pg_dump -h "${DB_HOST}" -p "${DB_PORT}" -U "${DB_USER}" "${DB_NAME}" > "${BACKUP_FILE}"
#"C:\Program Files\PostgreSQL\14\bin\pg_dump.exe" -h "${DB_HOST}" -p "${DB_PORT}" -U "${DB_USER}" -F c -b -v -f "${BACKUP_FILE}" "${DB_NAME}"


# Verifica se o dump foi criado com sucesso
if [ $? -eq 0 ]; then
    echo "Backup realizado com sucesso: ${BACKUP_FILE}"
else
    echo "Backup falhou."
fi