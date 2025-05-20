FROM swipl

WORKDIR /app

COPY server.pl /app/

EXPOSE 8080

CMD ["swipl", "-q", "-f", "server.pl"]
