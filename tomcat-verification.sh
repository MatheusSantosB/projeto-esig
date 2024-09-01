#!/bin/bash

# Nome do serviço Tomcat
TOMCAT_SERVICE_NAME="tomcat"

# Função para verificar o status do serviço Tomcat
check_tomcat_status() {
  STATUS=$(systemctl is-active $TOMCAT_SERVICE_NAME)

  if [ "$STATUS" = "active" ]; then
    echo "O serviço Tomcat está rodando."
    return 0
  else
    echo "O serviço Tomcat está parado."
    return 1
  fi
}

# Função para reiniciar o Tomcat se ele estiver parado por mais de 1 minuto
restart_tomcat_if_stopped() {
  if check_tomcat_status; then
    echo "Tomcat está funcionando normalmente."
  else
    echo "Tomcat está parado. Verificando o tempo..."
    SLEEP_TIME=60 # 1 minuto
    sleep $SLEEP_TIME
    if ! check_tomcat_status; then
      echo "Reiniciando Tomcat após 1 minuto parado..."
      systemctl start $TOMCAT_SERVICE_NAME
      echo "Tomcat foi reiniciado."
    else
      echo "Tomcat foi iniciado automaticamente dentro de 1 minuto."
    fi
  fi
}

# Verificação e reinício do Tomcat
restart_tomcat_if_stopped