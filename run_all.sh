#!/usr/bin/env bash
set -u
mkdir -p build results

run_capture() { name="$1"; shift; { "$@"; } > "results/${name}.txt" 2>&1 || true; }
run_capture python_syntax python3 syntax/syntax_error.py
run_capture javascript_syntax node --check syntax/syntax_error.js
run_capture cpp_syntax g++ -std=c++17 syntax/syntax_error.cpp -o build/cpp_bad
run_capture python_semantics python3 semantics/semantics.py
run_capture javascript_semantics node semantics/semantics.js
g++ -std=c++17 semantics/semantics.cpp -o build/cpp_scope
run_capture cpp_semantics ./build/cpp_scope
g++ -std=c++17 -O2 memory/memory.cpp -o build/cpp_memory
run_capture cpp_profile python3 memory/profile_process.py ./build/cpp_memory
javac -d build memory/JavaMemory.java
run_capture java_profile python3 memory/profile_process.py java -cp build JavaMemory
if command -v rustc >/dev/null 2>&1; then
  rustc -O memory/rust_memory.rs -o build/rust_memory
  run_capture rust_profile python3 memory/profile_process.py ./build/rust_memory
else
  echo "rustc was not available in this environment. Run locally: rustc -O memory/rust_memory.rs -o build/rust_memory" > results/rust_profile.txt
fi
printf 'Completed. Review the results directory.\n'