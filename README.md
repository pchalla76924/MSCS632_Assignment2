# Assignment 2: Syntax, Semantics, and Memory Management

This repository contains the source programs and reproducible run commands for the report.

## Structure
- `syntax/`: deliberately invalid Python, JavaScript, and C++ examples
- `semantics/`: closure and type-system comparison programs
- `memory/`: Rust ownership, Java garbage collection, C++ manual allocation, and a Linux `/proc` profiler
- `results/`: captured compiler, interpreter, and profiling output

## Run
On Linux, macOS, WSL, or Git Bash with the required compilers installed:

```bash
chmod +x run_all.sh
./run_all.sh
```

For Rust separately:

```bash
rustc -O memory/rust_memory.rs -o build/rust_memory
python3 memory/profile_process.py ./build/rust_memory
```