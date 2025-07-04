# Dev Dive

Este projeto é uma API desenvolvida com FastAPI para gerenciar alunos, cursos e matrículas em uma instituição de ensino.

## Pré-requisitos

- [Python 3.10 ou superior instalado](https://www.python.org/downloads/)
   $ python3 -V

- [Git](https://git-scm.com/downloads)
   sudo apt install git

- [Docker](https://www.docker.com/get-started/)

Step 1: Uninstall Old Versions (if any)

First, remove any existing Docker installations to avoid conflicts.
Bash
   for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt remove $pkg; done

Step 2: Update the apt Package Index and Install Prerequisites
   sudo apt update
   sudo apt install ca-certificates curl gnupg

Step 3: Add Docker's Official GPG Key
   sudo install -m 0755 -d /etc/apt/keyrings
   curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

Step 4: Set up the Docker Repository
   echo \
   "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
   "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

Step 5: Install Docker Engine

   sudo apt update
   sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

Step 6: Verify Docker Installation
   sudo docker run hello-world

Step 7: Manage Docker as a Non-Root User (Optional but Recommended)

   By default, the docker command can only be run by the root user or by a user in the docker group. If you want to run Docker commands without sudo, you need to add your user to the docker group.

   Warning: The docker group grants root-level privileges. Only add users you trust to this group.

    Add your user to the docker group:
      sudo usermod -aG docker $USER

Apply the new group membership. You can either:

    Log out and log back in.

    Reboot your system.

    Run newgrp docker (this will only work for the current shell session).


## Passos para subir o projeto

1. **Faça o download do repositório:**
   [Clique aqui para realizar o download](https://github.com/wilxavier/divedev.git)

2. **Crie um ambiente virtual:**
   ```sh
   apt install python3.12-venv
   python3 -m venv ./venv
   ```

3. **Ative o ambiente virtual:**
   - No Linux/Mac:
     ```sh
     source venv/bin/activate
     deactivate
     ```
   - No Windows, abra um terminal no modo administrador e execute o comando:
   ```sh
   Set-ExecutionPolicy RemoteSigned
   ```

     ```sh
     venv\Scripts\activate
     ```

4. **Instale as dependências:**
   ```sh
   pip install -r requirements.txt
   ```

5. **Execute a aplicação:**
   ```sh
   uvicorn app:app --reload
   ```

6. **Acesse a documentação interativa:**

   Abra o navegador e acesse:  
   [http://127.0.0.1:8000/docs](http://127.0.0.1:8000/docs)

   Aqui você pode testar todos os endpoints da API de forma interativa.

   Ctrl + c -> derruba o servidor

---
CI - Continuos Integration 
CD - Continuos Deployment

---


---
hub.docker.com
imagem mais leve alpine -> alpine mais recente
## Estrutura do Projeto

- `app.py`: Arquivo principal da aplicação FastAPI.
- `models.py`: Modelos do banco de dados (SQLAlchemy).
- `schemas.py`: Schemas de validação (Pydantic).
- `database.py`: Configuração do banco de dados SQLite.
- `routers/`: Diretório com os arquivos de rotas (alunos, cursos, matrículas).
- `requirements.txt`: Lista de dependências do projeto.

---

- O banco de dados SQLite será criado automaticamente como `escola.db` na primeira execução.
- Para reiniciar o banco, basta apagar o arquivo `escola.db` (isso apagará todos os dados).

---
Day 2
build e dopois run
compose faz tudo

criacao do arquivo docker compose
   comando
      docker compose up
      ou
      docker compose -d (background)
      https://docs.docker.com/compose/file-watch/

      repo.new no github

Day 3

7. **Execute a aplicação:**
   ```sh
   sudo apt-get update
   sudo apt-get install apt-transport-https ca-certificates gnupg curl
   curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg
   echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
   sudo apt-get update && sudo apt-get install google-cloud-cli

   
   gcloud auth login
   gcloud config set project  PROJECT_ID
   gcloud run deploy --port=8000
   ```




