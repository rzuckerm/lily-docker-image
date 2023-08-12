FROM alpine:3.18.2

COPY LILY_* /tmp/
RUN apk add git make cmake gcc musl-dev && \
    mkdir -p /opt && \
    cd /opt && \
    git clone https://gitlab.com/FascinatedBox/lily.git -b v$(cat /tmp/LILY_VERSION) && \
    cd lily && \
    cmake . && \
    cmake --build . && \
    cp lily /usr/bin && \
    cd / && \
    rm -rf /opt/lily
