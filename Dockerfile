ARG UPSTREAM_TAG=stable
FROM n8nio/n8n:$UPSTREAM_TAG

USER root

# long-live stackoverflow
# source: https://stackoverflow.com/questions/62554991/how-do-i-install-python-on-alpine-linux
ENV PYTHONUNBUFFERED=1
RUN apk add --update --no-cache python3 py3-pip py3-virtualenv \
  && ln -sf python3 /usr/bin/python \
  && mkdir /venvs \
  && chown node -R /venvs

USER node
