# Python: dynamic typing, lexical scope, and nonlocal closure state
def make_accumulator(start):
    total = start
    def add(value):
        nonlocal total
        total += value
        return total
    return add

acc = make_accumulator(10)
print(acc(5))
print(acc(2.5))  # The closure accepts a float and total becomes a float.
