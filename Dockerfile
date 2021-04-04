FROM linuxserver/plex:1.22.1.4275-48e10484b-ls39

ARG TARGETPLATFORM

RUN apt-get update && apt-get install -y \
        ffmpeg \
    && rm -rf /var/lib/apt/lists/*

ARG TELLYTV_VERSION=1.1.0.8
RUN export TELLY_PLATFORM=$(echo ${TARGETPLATFORM} | sed -E 's#(linux)|/##g') && \
    mkdir -p /opt/tellytv && cd /opt/tellytv && \
    curl -L -o telly.tar.gz "https://github.com/tellytv/telly/releases/download/${TELLYTV_VERSION}/telly-${TELLYTV_VERSION}.linux-${TELLY_PLATFORM}.tar.gz" && \
    tar xvf telly.tar.gz --strip-components=1 && \
    rm telly.tar.gz && cd -

ADD run-tellytv.sh /etc/services.d/tellytv/run
