FROM python:3.9-slim

LABEL app=bot
COPY bot.py /bot/
COPY utils.py /bot/
COPY Secrets/ /bot/Secrets/
COPY requirements.txt /bot/
WORKDIR /bot/
RUN pip install -r requirements.txt

CMD ["python3", "bot.py"]