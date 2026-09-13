// C++: explicit new[] and delete[] expose manual lifetime control
#include <iostream>
#include <numeric>

int main() {
    const std::size_t count = 2'000'000;
    int* values = new int[count];
    for (std::size_t i = 0; i < count; ++i) values[i] = 1;

    long long sum = 0;
    for (std::size_t i = 0; i < count; ++i) sum += values[i];
    std::cout << "sum = " << sum << '\n';

    delete[] values;
    values = nullptr; // defensive step: avoids retaining a dangling address
    return 0;
}