// JavaScript: dynamic typing, lexical scope, and closure state
function makeAccumulator(start) {
    let total = start;
    return function add(value) {
        total += value;
        return total;
    };
}

const acc = makeAccumulator(10);
console.log(acc(5));
console.log(acc("2")); // Numeric 15 becomes string "152" through coercion.