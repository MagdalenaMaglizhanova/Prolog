FROM swipl

WORKDIR /app

COPY server.pl /app/

EXPOSE 10000

CMD ["swipl", "-q", "-f", "server.pl"]
