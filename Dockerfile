# Usar imagem base do Python Slim (mais leve)
FROM python:3.12-slim

# Definir o diretório de trabalho no contêiner
WORKDIR /app

# Copiar os arquivos do diretório atual para o contêiner
COPY . /app

# Instalar as dependências
RUN pip install --no-cache-dir -r requirements.txt

# Expor a porta correta para o contêiner
EXPOSE 5002

# Rodar a aplicação Flask
CMD ["python3", "main.py"]  # Certifique-se de que o nome do arquivo é o correto!
