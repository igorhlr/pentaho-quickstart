# **Manual Pentaho Dev Server 🛠️**

Guia rápido para configurar um servidor Pentaho para manipulação de dados com ajustes personalizados de memória da JDK e porta. Siga os passos abaixo para um setup rápido e funcional.

## **Pré-requisitos**

1. **Pentaho Server**: Baixe o arquivo Pentaho Server para incluir na raiz do projeto.
   - [Baixe aqui o pentaho-server-ce-9.4.0.0-343.zip](https://github.com/ambientelivre/legacy-pentaho-ce/)
   
2. **Docker**: Baixe e instale o Docker para gerenciar containers facilmente.
   - [Download Docker Desktop](https://www.docker.com/products/docker-desktop)

3. **Visual Studio Code (VSCode)**: Use o VSCode para editar e visualizar os arquivos de configuração.

## **Passo a Passo para Configuração**

### 1. Visualizar o README.md
- Abra o README.md no VSCode e visualize com:
  - **Windows/Linux**: `Ctrl + Shift + V`
  - **Mac**: `Cmd + Shift + V`

### 2. Configure o Docker

- Abra o terminal na raiz do projeto e execute o comando abaixo para iniciar o Docker Compose:
  
  ```bash
  docker-compose up --build -d
  ```

### 3. Acessar o Container do Pentaho

- Entre no container do Pentaho pelo terminal com o comando:

  ```bash
  docker exec -ti pentaho9-server /bin/bash
  ```

### 4. Ajustes de Conector MySQL (Se necessário)

Antes de iniciar o Pentaho, faça os ajustes no conector do MySQL se estiver usando MySQL 5.7:

1. **Remover conector antigo do MySQL 5.7**:

   ```bash
   rm -rf /opt/pentaho-server/pentaho-server/tomcat/lib/mysql-connector-java-5.1.17.jar
   ```

2. **Mover o conector MySQL 5.7 para a pasta correta**:

   ```bash
   mv /opt/mysql-connector-java-5.1.9.jar /opt/pentaho-server/pentaho-server/tomcat/lib
   ```

### 5. Iniciar o Servidor Pentaho

- Inicie o Pentaho Server com o comando:

  ```bash
  /opt/pentaho-server/pentaho-server/start-pentaho.sh
  ```

### 6. Acessar o Pentaho

- Após iniciar o servidor, acesse o Pentaho em seu navegador no endereço:

  [http://localhost:8080/pentaho/Login](http://localhost:8080/pentaho/Login)

  - **Login**: Admin
  - **Senha**: password

---

## **Dicas Adicionais** 📌

- **Ajuste de Memória JDK**: Se necessário, ajuste a alocação de memória do Docker no Docker Desktop:
  - **Path**: Docker -> Configurações -> Resources -> Advanced.

- **Modificação de Portas**: Modifique as portas do `docker-compose.yml` conforme sua necessidade de configuração.

- **VSCode**: Utilize as extensões para Docker e suporte a Shell Scripts para um gerenciamento mais fácil e direto dentro do editor.
