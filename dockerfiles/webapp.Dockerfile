FROM elixir:1.14.2 AS base

EXPOSE 4000

ARG USER_GID
ARG USER_UID

RUN if getent passwd $USER_UID; then userdel "$(id -nu $USER_UID)"; fi
RUN if getent group $USER_GID; then groupdel "$(id -ng $USER_GID)"; fi

RUN groupadd --gid $USER_GID app
RUN useradd --uid $USER_UID --gid $USER_GID --create-home app

RUN mkdir /srv/app && chown app:app /srv/app

RUN apt-get update && apt-get install -y inotify-tools

# Install Hex package manager.
# The --force flag skips the interactive prompt.

USER app

RUN mix local.hex --force && mix local.rebar --force

WORKDIR /srv/app

###############################################################

FROM base AS development

CMD ["mix", "phx.server"]
