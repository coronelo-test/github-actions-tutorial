# Etapa 1: Entorno base y pruebas
FROM python:3.10-alpine AS base

# Evita que Python escriba archivos .pyc en el disco
ENV PYTHONDONTWRITEBYTECODE=1
# Evita que Python haga buffering de stdout y stderr
ENV PYTHONUNBUFFERED=1
ENV PIP_ROOT_USER_ACTION=ignore

WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY src/ ./src

# Testing stage
FROM base AS tests
COPY tests/ ./tests
RUN pytest

# Production stage
FROM base AS production
#EXPOSE 8000
CMD ["python", "-m", "src"]