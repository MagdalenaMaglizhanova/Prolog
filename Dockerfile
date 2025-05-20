FROM swipl

WORKDIR /app

COPY server.pl /app/

CMD ["swipl", "-q", "-f", "server.pl"]

