
a = [1.0, 2.0, 3.0]
b = copy(a)
wrong = a
println("before: a =", a)  # prints before: a = [1.0, 2.0, 3.0]
println("before: b =", b)  # prints before: b = [1.0, 2.0, 3.0]
wrong[2] = 666.0
println("after: a =", a)   # prints after: a = [1.0, 666.0, 3.0]
                           #     even though you changed [wrong]
