// Intentional syntax error: missing closing parenthesis in function header
function calculateSum(arr {
    let total = 0;
    for (const num of arr) {
        total += num;
    }
    return total;
}

const numbers = [1, 2, 3, 4, 5];
console.log("Sum in JavaScript:", calculateSum(numbers));
