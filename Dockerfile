# FROM tiangolo/uvicorn-gunicorn-fastapi:python3.11
# COPY /app /app
# COPY pyproject.toml /app
# WORKDIR /app
# ENV PYTHONPATH=${PYTHONPATH}:${PWD}
# RUN pip3 install poetry
# RUN poetry config virtualenvs.create false
# RUN poetry install --no-dev


FROM python:3.12.3-slim-bookworm

ARG USER_ID
ARG GROUP_ID

ENV PYTHONFAULTHANDLER=1 \
    PYTHONHASHSEED=random \
    PYTHONUNBUFFERED=1

ENV PYROOT /pyroot
ENV PYTHONUSERBASE $PYROOT
ENV PATH "$PYROOT/bin:$PATH"
ENV POETRY_VERSION=1.8.0

RUN pip install "poetry==$POETRY_VERSION"

COPY pyproject.toml ./

RUN poetry config virtualenvs.create false \
    && poetry install

COPY --chown=app:app ./app/ /api

USER ${USER_ID}

WORKDIR /api

EXPOSE 8080
ENTRYPOINT ["uvicorn"]
CMD ["app.main:app", "--host", "0.0.0.0", "--port", "8080", "--reload"]
