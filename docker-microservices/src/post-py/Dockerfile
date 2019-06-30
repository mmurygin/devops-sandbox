FROM python:3.6.0

WORKDIR /app

COPY requirements.txt .

RUN pip install -r /app/requirements.txt

COPY . .

ENTRYPOINT ["python3", "post_app.py"]
