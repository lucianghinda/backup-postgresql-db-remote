# A simple script to backup a PostgreSQL DB to a Cloudflare R2 endpoint

## How to use it

### 1. Create an account on Cloudflare

1. Go to https://www.cloudflare.com/developer-platform/r2/ and create an account
2. Create a bucket in R2 (make sure it is not public)
3. Go to "Manage R2 API Tokens" and generate a token for your own bucket. Keep that around to add it to your environment variables

### 2. Configure environment variables

Configure your environment with environment variables that are shown in `.env.sample`.

```bash
cp .env.sample .env
```

### 3. Install `pg_dump` on the machine where you will run this script

Install [pg_dump](https://www.postgresql.org/docs/current/app-pgdump.html) on the machine where you plan to run this script

### 4. Configure password for the user that will be used to connect to PostgreSQL

pg_dump does not allow to directly specify the password.

So you should configure the password using `.pgpass` file.

### 4. Run the script

```bash
bundle exec ruby run.rb --name DB_NAME`
```
