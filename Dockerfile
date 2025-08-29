
# Usar imagen ligera y compatible ARM
FROM python:3.9-slim

# Directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiar solo requirements primero para aprovechar cache
COPY ./requirements.txt ./requirements.txt

# Instalar dependencias
RUN pip install --no-cache-dir --upgrade pip setuptools wheel \
    && pip install --no-cache-dir -r ./requirements.txt

# Copiar el código de la app
COPY ./app.py .
COPY ./model ./model

# Exponer el puerto 80
EXPOSE 80

# Comando para arrancar la app
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "80"]
