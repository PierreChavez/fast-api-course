# Use only the runtime stage for simplicity
FROM python:3.9.19-slim as runtime
LABEL authors="PierreChavez"
WORKDIR /usr/src/app

# Install dependencies including uvicorn
COPY requirements.txt ./
RUN apt-get update && \
        apt-get install -y gcc && \
        pip install --no-cache-dir -r requirements.txt

# Copy the rest of your application
COPY . .

EXPOSE 3000

# Define entrypoint with the full path to uvicorn if necessary
ENTRYPOINT uvicorn --host 0.0.0.0 --port 3000 main:app  --reload