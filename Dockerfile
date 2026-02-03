FROM python:3.12-slim

# Evita .pyc e deixa logs mais "diretos"
ENV PYTHONDONTWHRITEBYTECODE=1
ENV PYTHONUNBUNFFERED=1

# instala as dependências primeiro (melhor cache)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copia o código da aplicação
COPY app ./app

# Expõe a porta do Uvicorn
EXPOSE 8000

# Comando para iniciar a aplicação
CMD ["uvicorn","app.main:app", "--host", "0.0.0.0", "--port", "8000"]