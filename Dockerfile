FROM python:3.8.12-slim-buster

LABEL app=bot
COPY bot.py /bot/
COPY utils.py /bot/
COPY requirements.txt /bot/
WORKDIR /bot/
RUN pip install -r requirements.txt

CMD ["python3", "bot.py"]