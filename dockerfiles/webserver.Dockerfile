FROM caddy:2.6.2-alpine as base

RUN mkdir -p /srv/app/public

EXPOSE 80
EXPOSE 443

###############################################################

FROM base as development