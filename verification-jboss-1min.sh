#!/bin/bash

# Nome do serviço WildFly
WILDFLY_SERVICE_NAME="wildfly"

# Função para verificar o status do serviço WildFly
check_wildfly_status() {
  STATUS=$(systemctl is-active $WILDFLY_SERVICE_NAME)

  if [ "$STATUS" = "active" ]; then
    echo "O serviço WildFly está rodando."
    return 0
  else
    echo "O serviço WildFly está parado."
    return 1
  fi
}

# Função para reiniciar o WildFly se ele estiver parado por mais de 1 minuto
restart_wildfly_if_stopped() {
  if check_wildfly_status; then
    echo "WildFly está funcionando normalmente."
  else
    echo "WildFly está parado. Verificando o tempo..."
    SLEEP_TIME=60 # 1 minuto
    sleep $SLEEP_TIME
    if ! check_wildfly_status; then
      echo "Reiniciando WildFly após 1 minuto parado..."
      systemctl start $WILDFLY_SERVICE_NAME
      echo "WildFly foi reiniciado."
    else
      echo "WildFly foi iniciado automaticamente dentro de 1 minuto."
    fi
  fi
}

# Verificação e reinício do WildFly
restart_wildfly_if_stopped