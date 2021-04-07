#!/usr/bin/with-contenv bash
# shellcheck shell=bash

set -e

cd /config
exec s6-setuidgid plex /opt/tellytv/telly
