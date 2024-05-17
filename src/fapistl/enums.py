from enum import Enum


class RuntimeEnvironment(str, Enum):
    """Defines the environment the system is currently running in."""

    local = "local"
    sandbox = "sandbox"
    dev = "dev"
    stage = "stage"
    prod = "prod"
