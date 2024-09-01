# Projeto ESIG

Este projeto contém scripts para realização de DUMP e RESTORE, tarefas relacionadas à administração de bancos de dados PostgreSQL e gerenciamento de servidores de aplicação Tomcat e JBoss.


## Pré-requisitos

- **PostgreSQL**: Necessário para manipulação dos bancos de dados.
- **Tomcat e JBoss**: Servidores de aplicação para os quais existem scripts de verificação.
- **Shell Script**: Ambiente Unix/Linux para execução dos scripts.

## Instalação (executando primeira parte da atividade)

1. **Clone o repositório**:
  ```   
  git clone https://github.com/MatheusSantosB/projeto-esig.git
  ```
2. **Acesse o diretorio do projeto:**
  ```   
  cd projetoesig/
  ```
3. **Para gerar e popular o banco:**
  ```
   psql -U seu_usuario -d postgres -f script-gerar-banco.sql
  ```
4. **Para entrar no banco e conferir se funcionou (opcional):**
  ```
  psql -U postgres -h localhost
  ```
4.1 **Conectar ao banco:**
  ```
  \c projeto_esig;
  ```
4.2 **Conferir a tabela:**
  ```
  SELECT * FROM cadastro;
  ```
4.3 **Sair:**
  ```
  \q
  ```
5  **Gerar o dump:**
  ``` 
  sudo ./dump-database-projeto_esig.sh
  ```
6  **Realizar o restore:**
  ```   
  sudo ./restore.sh
  ```
## Verificação de servidores Tomcat

- **Siga esse tutorial para instalar o servidor do Tomcat caso não tenha:**   
```
https://www.digitalocean.com/community/tutorials/install-tomcat-9-ubuntu-1804-pt
```

1  **Gerar a verificação Tomcat:**
  ```
  sudo ./tomcat-verification.sh
  ```
## Verificação de servidores Jboss (Wildfly)

- **Siga esse tutorial para instalar o servidor do Jboss(Wildfly) caso não tenha:**
``` 
https://www.letscloud.io/community/como-instalar-o-wildfly-no-ubuntu-1804  
```
1  **Gerar a verificação Jboss(Wildfly):**
  ```  
  sudo ./verification-jboss-1min.sh
  ```
