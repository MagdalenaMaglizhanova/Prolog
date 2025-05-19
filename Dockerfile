FROM swipl

WORKDIR /app

COPY server.pl /app/

CMD ["swipl", "-s", "server.pl", "-g", "http_server."]
