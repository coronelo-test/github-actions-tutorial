# Etapa 1: Entorno base y pruebas
FROM python:3.10-alpine AS testing

# Evita que Python escriba archivos .pyc en el disco
ENV PYTHONDONTWRITEBYTECODE 1
# Evita que Python haga buffering de stdout y stderr
ENV PYTHONUNBUFFERED 1

ENV PIP_ROOT_USER_ACTION=ignore

RUN MKDIR /app

WORKDIR /app

# Instalar dependencias necesarias
COPY requirements.txt . 
# (Asumiendo que tienes pytest en requirements.txt, o puedes instalarlo directo)
RUN pip install --no-cache-dir pytest

# Copiar todo el código al contenedor
COPY . .

# Ejecutar las pruebas inmediatamente al construir
RUN pytest tests/test_calculator.py

# Etapa 2: Imagen final para producción (sin herramientas de test)
FROM python:3.12-slim AS production

WORKDIR /app

# Copiar solo el código necesario desde la etapa anterior
COPY --from=testing /app/app.py .

CMD ["python", "app.py"]
