# CentOS Flask App with Jenkins + SonarQube CI

This is a minimal Flask app running on CentOS Docker container.

## Features

- Built with CentOS 8 + Python 3
- Jenkins CI pipeline
- SonarQube code scanning

## Quick Start

```bash
docker build -t centos-flask-app .
docker run -d -p 5000:5000 centos-flask-app

