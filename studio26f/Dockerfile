FROM debian:trixie-slim AS builder

ENV DEBIAN_FRONTEND=noninteractive
ENV VCPKG_FORCE_SYSTEM_BINARIES=1

RUN apt-get update && apt-get install -y --no-install-recommends \
    autoconf \
    automake \
    build-essential \
    ca-certificates \
    cmake \
    curl \
    g++ \
    git \
    libtool \
    m4 \
    ninja-build \
    pkg-config \
    tar \
    unzip \
    zip \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .

RUN git submodule update --init --recursive || true

RUN if [ -f "vcpkg/ports/magic-enum/portfile.cmake" ]; then \
    sed -i 's/SHA512 [0-9a-f]\{128\}/SHA512 fa3792e9c69c57e437d6325b7659cf25e6cbdda3326ffeaf0411d9838822095b15306f322ad2ebd5ec68b905ef2aed08880d2507e7d8a8559ab3c5be6c8ce99c/' \
    vcpkg/ports/magic-enum/portfile.cmake; \
    fi

RUN cd vcpkg && ./bootstrap-vcpkg.sh
RUN cmake -S . -B build -DCMAKE_BUILD_TYPE=Release -G Ninja -DVCPKG_FORCE_SYSTEM_BINARIES=1
RUN cmake --build build --target Studio26F -j$(nproc)

FROM debian:trixie-slim AS runner
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    libpq5 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /opt/studio26f
COPY --from=builder /app/build/Studio26F ./Studio26F
COPY --from=builder /app/verifyEmail.html ./verifyEmail.html

EXPOSE 8080 8443
CMD ["./Studio26F"]
