FROM alpine
WORKDIR /app
RUN apk --no-cache add postgresql18-client
COPY transform.sql run.sh .

# Default for Railway's cron; set in Railway Variables when deploying
ENV CRON_SCHEDULE="0 * * * *"

CMD ["sh", "run.sh"]
