from __future__ import annotations

from pydantic_settings import BaseSettings


class Config(BaseSettings):
    # Todo: read an env file for dev config
    service_name: str = 'fastapi_template'
    secret_key: str = 'Import from Env'


config = Config()
