### Builder

FROM python:3.8-slim as builder

COPY ./requirements.txt .

# use this hack to create man pages on 'slim' varients
# https://github.com/debuerreotype/debuerreotype/issues/10#issuecomment-450480318
RUN for i in $(seq 1 8); do mkdir -p "/usr/share/man/man${i}"; done \
    && apt-get update -qq && apt-get install build-essential gcc git -y -qq \
    && pip install --trusted-host pypi.python.org --upgrade pip \
    && pip wheel --no-cache-dir --no-deps --wheel-dir /wheels --trusted-host pypi.python.org -r requirements.txt

### Final

FROM python:3.8-slim

ENV PYTHONUNBUFFERED 1
ENV PYTHONPATH "${PYTHONPATH}:/app"

WORKDIR /app
COPY . /app

COPY --from=builder /wheels /wheels
RUN pip install --trusted-host pypi.python.org --upgrade pip \
    && pip install --no-cache /wheels/*

CMD pytest
