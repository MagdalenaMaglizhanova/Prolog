FROM swipl

WORKDIR /app

COPY server.pl /app/

# Казваме на Render, че може да очаква отворен порт
EXPOSE 8080

# Стартираме Prolog сървъра
CMD ["swipl", "-q", "-f", "server.pl"]

