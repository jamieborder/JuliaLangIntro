# CIVL2530 Assignment 1 Question 9
# Author: Dorival Pedroso
# Date: 16/03/2017

function lininterp(x::Float64, X::Vector{Float64}, Y::Vector{Float64})::Float64
    n = length(X)
    if x < X[1] || x > X[n]
        throw("x is out of range")
    end
    for i=2:n
        if x <= X[i]
			return Y[i-1] + (x - X[i-1]) * (Y[i] - Y[i-1]) / (X[i] - X[i-1])
        end
    end
end

X = [0.0, 1.0, 2.0, 3.0, 4.0, 5.0]
Y = [0.0, 20.0, 60.0, 68.0, 77.0, 110.0]

println("y(2.6) = ", lininterp(2.6, X, Y))
println("y(3.5) = ", lininterp(3.5, X, Y))

N = 20
Xt = linspace(0.0, 5.0, N)
Yt = zeros(N)
for i=1:N
    Yt[i] = lininterp(Xt[i], X, Y)
end

using PyPlot
plot(X, Y, "go")
plot(Xt, Yt, "b-")
grid()
xlabel("x")
ylabel("y")
savefig("a1_9.png")
