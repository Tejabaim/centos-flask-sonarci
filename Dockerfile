FROM centos:8

RUN dnf install -y python3 python3-pip && \
    pip3 install --upgrade pip

WORKDIR /app

COPY requirements.txt .
RUN pip3 install -r requirements.txt

COPY . .

CMD ["python3", "app.py"]

