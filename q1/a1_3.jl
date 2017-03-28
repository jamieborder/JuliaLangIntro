# CIVL2530 Assignment 1 Question 3
# Author: Dorival Pedroso
# Date: 16/03/2017

A = [Float64(i)    for i=1:10]
B = [2.0 * i       for i=1:10]
C = [i % 2         for i=1:10]
D = [(2.0*i) % 2   for i=1:10]
E = [Float64(i+j)  for i=1:3, j=1:4]
F = [(i+j) % 2     for i=1:3, j=1:4]
G = [1 - (i+j) % 2 for i=1:3, j=1:4]
println("A = ", A)
println("B = ", B)
println("C = ", C)
println("D = ", D)
println("E = ", E)
println("F = ", F)
println("G = ", G)

println("\nA: ")
for i=1:10
    println(Float64(i))
end

println("\nB: ")
for i=1:10
    println(2.0*i)
end

println("\nC: ")
for i=1:10
    println(i % 2)
end

println("\nD: ")
for i=1:10
    println((2.0*i) % 2)
end

println("\nE: ")
for i=1:3
    for j=1:4
        println(Float64(i+j))
    end
end

println("\nF: ")
for i=1:3
    for j=1:4
        println(Float64(i+j)%2)
    end
end

println("\nG: ")
for i=1:3
    for j=1:4
        println(1 - (i+j) % 2)
    end
end
