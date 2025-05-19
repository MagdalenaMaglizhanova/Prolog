FROM swipl

WORKDIR /app

COPY server.pl /app/

CMD ["swipl", "-s", "server.pl", "-g", "start_server", "-t", "halt"]
