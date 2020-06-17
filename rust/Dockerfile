# Build Stage
FROM rust:latest AS builder
WORKDIR /usr/src/
RUN rustup target add x86_64-unknown-linux-musl

RUN USER=root cargo new hello-k3s
WORKDIR /usr/src/hello-k3s
COPY Cargo.toml Cargo.lock ./
RUN cargo build --release

COPY src ./src
RUN cargo install --target x86_64-unknown-linux-musl --path .

# Bundle Stage
FROM scratch
COPY --from=builder /usr/local/cargo/bin/hello-k3s .
USER 1000
CMD ["./hello-k3s", "-a", "0.0.0.0", "-p", "3000"]
EXPOSE 3000
