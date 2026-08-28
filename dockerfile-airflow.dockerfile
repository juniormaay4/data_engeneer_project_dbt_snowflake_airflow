# ============================================================
# AIRFLOW BASE IMAGE
# ============================================================

FROM apache/airflow:2.10.5-python3.12


# ============================================================
# INSTALL SYSTEM DEPENDENCIES
# ============================================================

USER root

RUN apt-get update && apt-get install -y \
    gcc \
    g++ \
    build-essential \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


# ============================================================
# PYTHON DEPENDENCIES
# ============================================================

USER airflow

RUN pip install --no-cache-dir \
    dbt-core \
    dbt-snowflake \
    psycopg2-binary \
    kafka-python \
    minio \
    boto3