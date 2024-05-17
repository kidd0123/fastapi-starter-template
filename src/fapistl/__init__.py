import os

# local imports
from fapistl.enums import RuntimeEnvironment

envstr = os.environ.get("ENVIRONMENT")
if envstr in RuntimeEnvironment._value2member_map_:  # noqa: SLF001
    env = RuntimeEnvironment(envstr)
else:
    env = RuntimeEnvironment.local
