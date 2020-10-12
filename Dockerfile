FROM gcc:10.2.0 AS base

ARG B2_VERSION=0.13.0
ENV B2_VERSION=${B2_VERSION}

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    curl \
    && curl -sSfO https://download.build2.org/${B2_VERSION}/build2-install-${B2_VERSION}.sh \
    && sh build2-install-${B2_VERSION}.sh --local --no-check --yes /build2 \
    && rm -r /build2/share

FROM gcc:10.2.0

COPY --from=base /build2 /usr
