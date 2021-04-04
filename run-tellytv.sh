#!/usr/bin/with-contenv bash

cd /config
exec s6-setuidgid plex /opt/tellytv/tellytv
