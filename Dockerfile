FROM rust:1 as builder

WORKDIR /app

COPY . /app
RUN cargo build --release


FROM debian:buster-slim

COPY --from=builder /app/target/release/rust-waypoint-demo /app/rust-waypoint-demo

ENTRYPOINT ["/app/rust-waypoint-demo"]