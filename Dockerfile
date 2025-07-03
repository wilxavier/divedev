# Etapa 1: Base
# Usamos uma imagem oficial do Python. A tag 'alpine' resulta em uma imagem
# muito menor, ideal para produção, pois contém apenas o mínimo necessário.
FROM python:3.11-alpine

# Etapa 2: Configuração do Ambiente
# Define o diretório de trabalho dentro do contêiner. Todos os comandos
# subsequentes serão executados a partir deste diretório.
WORKDIR /app

# Etapa 3: Instalação de Dependências
# Copiamos o arquivo de dependências primeiro para aproveitar o cache de camadas do Docker.
# Se o requirements.txt não mudar, o Docker não reinstalará as dependências em builds futuros.
COPY requirements.txt .

# Instala as dependências. A flag --no-cache-dir desabilita o cache do pip, reduzindo o tamanho da imagem.
RUN pip install --no-cache-dir -r requirements.txt

# Etapa 4: Copiar Código da Aplicação
# Copia o restante dos arquivos da aplicação para o diretório de trabalho no contêiner.
COPY . .

# Etapa 5: Execução
# Expõe a porta 8000, que é a porta padrão do Uvicorn.
EXPOSE 8000

# Comando para iniciar a aplicação Uvicorn.
# O host '0.0.0.0' torna a aplicação acessível de fora do contêiner.
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]