run:
    mkdir -p build target/site/pkg
    DEOR_LIB=lib deor hello.deor build/main.rs
    DEOR_LIB=lib deor client.deor build/client.rs
    sed -i 's/: Let\b//g' build/main.rs
    sed -i 's/: Let\b//g' build/client.rs
    cargo build --bin DeorApi
    cargo build --lib --target wasm32-unknown-unknown --features client
    wasm-bindgen --out-dir target/site/pkg --target web target/wasm32-unknown-unknown/debug/deor_client.wasm
    cargo run --bin DeorApi

build:
    mkdir -p build target/site/pkg
    DEOR_LIB=lib deor hello.deor build/main.rs
    DEOR_LIB=lib deor client.deor build/client.rs
    sed -i 's/: Let\b//g' build/main.rs
    sed -i 's/: Let\b//g' build/client.rs
    cargo build --bin DeorApi
    cargo build --lib --target wasm32-unknown-unknown --features client
    wasm-bindgen --out-dir target/site/pkg --target web target/wasm32-unknown-unknown/debug/deor_client.wasm

setup:
    rustup target add wasm32-unknown-unknown
    cargo install wasm-bindgen-cli --version 0.2.126

update-deor-with-latest:
    curl -sSf https://raw.githubusercontent.com/nathanphoffman/DeorLang/main/setup/update.sh | sh
