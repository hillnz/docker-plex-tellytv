# HACK hardcode major version 1 as renovate only supports 3 version parts
# renovate: datasource=docker depName=jonoh/plex versioning=regex:^1\.(?<major>\d+)\.(?<minor>\d+)\.(?<patch>\d+).+
ARG PLEX_VERSION=1.29.1.6316-f4cdfea9c
FROM jonoh/plex:${PLEX_VERSION}

ARG TARGETPLATFORM

RUN echo "$PLEX_VERSION" >/VERSION

RUN apt-get update && apt-get install -y \
        ffmpeg \
    && rm -rf /var/lib/apt/lists/*

# HACK hardcode "1.1" as prefix as the 1.5 version is not considered ready
# renovate: datasource=github-tags depName=tellytv/telly versioning=regex:^1\.1\.(?<major>\d+)\.(?<minor>\d+)$
ARG TELLYTV_VERSION=1.1.0.8
RUN export TELLY_PLATFORM=$(echo ${TARGETPLATFORM} | sed -E 's#(linux)|/##g') && \
    mkdir -p /opt/tellytv && cd /opt/tellytv && \
    curl -L -o telly.tar.gz "https://github.com/tellytv/telly/releases/download/${TELLYTV_VERSION}/telly-${TELLYTV_VERSION}.linux-${TELLY_PLATFORM}.tar.gz" && \
    tar xvf telly.tar.gz --strip-components=1 && \
    rm telly.tar.gz && cd -

ADD run-tellytv.sh /etc/services.d/tellytv/run
