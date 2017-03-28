# CIVL2530 Assignment 1 Question 2
# Author: Dorival Pedroso
# Date: 16/03/2017

srand(2530)

v = [6.0, 5.1, 4.2, 3.3, 2.4, 1.5, 0.6]

println("v      = ", v)
println("len(v) = ", length(v))
println("sum(v) = ", sum(v))

w = copy(v)
w[4] = 33.33
println("v      = ", v)
println("w      = ", w)

s = shuffle(w)
println("s      = ", s)
max, idx = findmax(s)
println("idx    = ", idx)
println("max    = ", max)

shuffle!(v)
println("v      = ", v)
sort!(v)
println("v      = ", v)
println("mu     = ", mean(v))
