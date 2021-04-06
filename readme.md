# plex-tellytv

The [official Plex image](https://hub.docker.com/r/plexinc/pms-docker), plus [tellytv](https://github.com/tellytv/telly) and FFmpeg.
tellytv makes it easy to use IPTV with Plex DVR.

The `dev` version of tellytv is what's included since the repo advises this is the best option for "most users".

## Usage

Follow the [Plex image instructions](https://hub.docker.com/r/linuxserver/plex). Everything works the same.

For tellytv, follow [their instructions](https://github.com/tellytv/telly/tree/dev) to get your config file prepared, then save it to your Plex configuration directory (the directory you mounted to `/config`) as `telly.config.toml`.

## Tags

Tags mirror the Plex image's tags, which contain the Plex version. Or you can just use `latest`.

## Caveats

Tellytv releases seem to be a bit eratic. This image used to copy from the official (dev) docker image, but as of the time of writing this hasn't been updated for two years.
We now include the latest 1.1.x from the Github releases, as it seems this is probably the most correct version at this time.
