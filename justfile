run:
    mkdir -p build
    DEOR_LIB=lib deor hello.deor build/main.rs
    sed -i 's/: Let\b//g' build/main.rs
    cargo run

build:
    mkdir -p build
    DEOR_LIB=lib deor hello.deor build/main.rs
    sed -i 's/: Let\b//g' build/main.rs
    cargo build

update-deor-with-latest:
    curl -sSf https://raw.githubusercontent.com/nathanphoffman/DeorLang/main/setup/update.sh | sh
