// Intentional syntax error: missing semicolon after total initialization
#include <iostream>
using namespace std;

int calculateSum(const int arr[], int size) {
    int total = 0
    for (int i = 0; i < size; ++i) {
        total += arr[i];
    }
    return total;
}

int main() {
    int numbers[] = {1, 2, 3, 4, 5};
    int size = sizeof(numbers) / sizeof(numbers[0]);
    cout << "Sum in C++: " << calculateSum(numbers, size) << endl;
    return 0;
}