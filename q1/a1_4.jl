# CIVL2530 Assignment 1 Question 4
# Author: Dorival Pedroso
# Date: 16/03/2017

X = Float64[]
Y = Float64[]
println("X = ", X)
println("Y = ", Y)

x = 0.0
y = 0.0
println("x = ", x)
println("y = ", y)

cx = 0.4
cy = 0.4
println("cx = ", cx)
println("cy = ", cy)

k = 1
while x^2 + y^2 <= 4 && k <= 50
    t = y
    y = 2.0*x*y + cy
    x = x*x - t*t + cx
    push!(X, x)
    push!(Y, y)
    k += 1
end

println("X = ", X)
println("Y = ", Y)

using PyPlot
plot(X, Y, "r.-")
axis("equal")
grid()
xlabel("x")
ylabel("y")
savefig("a1_4.png")

println()
println("the end")
