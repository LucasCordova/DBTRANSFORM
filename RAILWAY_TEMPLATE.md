# dbtransform (Railway template)

Runs a PostgreSQL SQL script against a database on a schedule. Ideal for scheduled transforms using Railway cron.

**What it does:** Reads `TRANSFORM_SQL` → connects to PostgreSQL via `DATABASE_URL` → executes the SQL → exits.

Multi-line SQL is fully supported. Change the SQL anytime in Railway Variables — no redeploy needed.

---

## Quick start

1. Click **Deploy** (or use the template URL below).
2. Set **Variables:** `DATABASE_URL`, `TRANSFORM_SQL` (both required). Optionally `DEBUG=true`.
3. In **Settings**, set **Cron Schedule** (e.g. `0 * * * *` for every hour).
4. Deploy. The service runs your SQL on the schedule and exits each time.

**Template URL:** [Add your Railway template deploy URL here]

---

## Creating the template (template authors)

If you're publishing this as a Railway template:

1. In [Railway](https://railway.app) → Workspace → **Templates** → **New Template**.
2. Add a service with **Source:** this GitHub repo (or your fork).
3. Configure **Variables** in the template so deployers are prompted for:
   - `DATABASE_URL` (required)
   - `TRANSFORM_SQL` (required)
   - `DEBUG` (optional)
4. Leave **Cron Schedule** unset in the template so each deployer sets their own in Service Settings.
5. Save and (optional) publish to the [Railway template marketplace](https://railway.com/templates).

**GitHub repo:** [Add your repository URL here]

---

## Environment variables

| Variable | Required | Description |
|----------|----------|-------------|
| `DATABASE_URL` | **Yes** | PostgreSQL connection string (`postgresql://user:pass@host:port/dbname`). Use Railway's Postgres plugin and reference it if desired. |
| `TRANSFORM_SQL` | **Yes** | SQL to execute each run. Multi-line supported. Edit in Railway Variables anytime. |
| `DEBUG` | No | Set to `true` or `1` to log timestamps and full `psql` output. Default: `false`. |

---

## Cron schedule

Set in the service **Settings** tab → **Cron Schedule**.

| Example | Meaning |
|---------|---------|
| `0 * * * *` | Every hour at minute 0 |
| `*/15 * * * *` | Every 15 minutes |
| `0 0 * * *` | Once per day at midnight UTC |
| `0 9 * * 1-5` | Weekdays at 09:00 UTC |

Schedules use standard 5-field cron (minute, hour, day of month, month, day of week) in **UTC**.

---

## After deployment

- **Change SQL:** Edit the `TRANSFORM_SQL` variable in Railway Variables. No redeploy needed.
- **Change schedule:** Service **Settings** → **Cron Schedule**.
- **Logs:** View runs in the service **Deployments** / **Logs**. Set `DEBUG=true` for verbose output.

---

## Source

- **GitHub:** [repository URL]
- **Docker image (optional):** [Docker Hub or other image URL if you publish the image]

Fill in the bracketed placeholders above before publishing.
