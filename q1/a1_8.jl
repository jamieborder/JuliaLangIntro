# CIVL2530 Assignment 1 Question 8
# Author: Dorival Pedroso
# Date: 16/03/2017

function montecarlo1d(f::Function, a::Float64, b::Float64, N::Int64)::Float64
    L = b - a
    sum = 0.0
    for i=1:N
        x = a + L * rand()
        sum += f(x)
    end
    return sum * L / N
end

srand(2530)

function f(x::Float64)::Float64
    return exp(-x) * sin(x)
end

a = 0.0
b = 2.0 * pi
N = 1000

Amc = montecarlo1d(f, a, b, N)
Aana = (1.0 - exp(-2.0*pi)) / 2.0
error = abs(Amc - Aana)
println("Amc   = ", Amc)
println("Aana  = ", Aana)
println("error = ", error)
