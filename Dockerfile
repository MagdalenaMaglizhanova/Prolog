FROM swipl

WORKDIR /app

COPY server.pl .

CMD ["swipl", "server.pl"]

