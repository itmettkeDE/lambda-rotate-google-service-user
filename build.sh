#!/usr/bin/env bash
set -e

cross build --release --target x86_64-unknown-linux-musl "${@}"
strip "./target/x86_64-unknown-linux-musl/release/lambda-rotate-google-service-user"
cp "./target/x86_64-unknown-linux-musl/release/lambda-rotate-google-service-user" ./target/x86_64-unknown-linux-musl/release/bootstrap 
zip -r9 -j "./lambda-rotate-google-service-user.zip" ./target/x86_64-unknown-linux-musl/release/bootstrap
