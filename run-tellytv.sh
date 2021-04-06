#!/usr/bin/with-contenv bash

set -e

cd /config
exec s6-setuidgid plex /opt/tellytv/tellytv
