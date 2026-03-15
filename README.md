# Database Transformer

Run a PostgreSQL script on a schedule. Use as a **Railway template**: deploy, set your database URL and SQL in variables, and set the cron schedule in Settings.

## Use as a Railway template

1. **Create a template** from this repo and add it as a service (or use an existing template link).

2. **Configure the service**
   - **Variables:** Set `DATABASE_URL` and `TRANSFORM_SQL` (both required). Optionally set `DEBUG=1` for verbose logs.
   - **Settings → Cron Schedule:** Set when to run (e.g. `0 * * * *` for every hour).

3. **SQL:** Put the full SQL to run in the **`TRANSFORM_SQL`** variable in Railway Variables. Multi-line is supported. Change it anytime in the dashboard—no redeploy needed.

### Template variables

| Variable         | Required | Description                                                                 |
|-----------------|----------|-----------------------------------------------------------------------------|
| `DATABASE_URL`  | Yes      | PostgreSQL connection URL (e.g. `postgresql://user:pass@host:5432/dbname`). |
| `TRANSFORM_SQL` | Yes      | Full SQL to run each time. Edit in Railway Variables; multi-line supported. |
| `DEBUG`         | No       | Set to `1` or `true` to log each run with timestamps and full `psql` output. |

### After deployment

- **Cron schedule:** Service **Settings** → **Cron Schedule** (e.g. `0 * * * *` for hourly).
- **SQL:** Edit the **`TRANSFORM_SQL`** variable in Railway Variables.
