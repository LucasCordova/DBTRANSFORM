FROM alpine
WORKDIR /app
RUN apk --no-cache add postgresql18-client
COPY run.sh .
CMD ["sh", "run.sh"]
