// C++: static typing and a mutable lambda capture
#include <iostream>

int main() {
    double total = 10.0;
    auto add = [total](double value) mutable {
        total += value;
        return total;
    };

    std::cout << add(5.0) << '\n';
    std::cout << add(2.5) << '\n';
    std::cout << "outer total = " << total << '\n';
    return 0;
}