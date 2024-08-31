#!/bin/bash

# Obtém o diretório do script
SCRIPT_DIR=$(dirname "$(realpath "$0")")
BACKUP_DIR="${SCRIPT_DIR}/backup"

# Configura o banco de dados
DB_NAME="projeto_esig"
DB_USER="postgres"
DB_HOST="localhost"
DB_PORT="5432"

# Diagnóstico: Verifica o diretório de backup
echo "Script directory: ${SCRIPT_DIR}"
echo "Backup directory: ${BACKUP_DIR}"
echo "Looking for backups matching: ${BACKUP_DIR}/${DB_NAME}_backup_*.SQL"

# Encontra o arquivo de backup mais recente
BACKUP_FILE=$(ls -t "${BACKUP_DIR}/${DB_NAME}_backup_"*".SQL" 2>/dev/null | head -n 1)

# Diagnóstico: Verifica o arquivo de backup encontrado
if [ -z "${BACKUP_FILE}" ]; then
    echo "Nenhum arquivo de backup encontrado."
else
    echo "Arquivo de backup encontrado: ${BACKUP_FILE}"
fi

# Verifica se o arquivo de backup existe e restaura
if [ -f "${BACKUP_FILE}" ]; then
    # Apaga o banco de dados (se existir)
    dropdb -h "${DB_HOST}" -p "${DB_PORT}" -U "${DB_USER}" "${DB_NAME}" 2>/dev/null || {
        echo "Banco de dados ${DB_NAME} não existia ou não pôde ser apagado."
    }

    # Cria o banco de dados novamente
    createdb -h "${DB_HOST}" -p "${DB_PORT}" -U "${DB_USER}" "${DB_NAME}" || {
        echo "Erro ao criar o banco de dados ${DB_NAME}."
        exit 1
    }

    # Restaura o banco de dados usando o arquivo SQL
    psql -h "${DB_HOST}" -p "${DB_PORT}" -U "${DB_USER}" -d "${DB_NAME}" -f "${BACKUP_FILE}"
    
    # Verifica o resultado da restauração
    if [ $? -eq 0 ]; then
        echo "Restore completo: ${BACKUP_FILE}"
    else
        echo "Restore falhou"
    fi
else
    echo "Arquivo de backup não encontrado."
fi