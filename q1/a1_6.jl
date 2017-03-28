# CIVL2530 Assignment 1 Question 6
# Author: Dorival Pedroso
# Date: 16/03/2017

function trapezoid(f::Function, a::Float64, b::Float64, N::Int64)::Float64
    h = (b - a) / N
    x = a
    sum = 0.0
    for i=1:N
        xold = x
        x += h
        sum += f(x) + f(xold)
    end
    A = sum * h / 2.0
    return A
end

function f(x::Float64)::Float64
    return x
end

function g(x::Float64)::Float64
    return sqrt(1.0 + sin(x)^3.0)
end

a = 0.0
b = 1.0

Abest = 0.5
Atrap = trapezoid(f, a, b, 1)
error = abs(Abest - Atrap)
println("Abest = ", Abest)
println("Atrap = ", Atrap)
println("error = ", error)

println()

Abest = 1.08268158558
Atrap = trapezoid(g, a, b, 20)
error = abs(Abest - Atrap)
println("Abest = ", Abest)
println("Atrap = ", Atrap)
println("error = ", error)
