using PyPlot

# this function takes another function
function giveMeYourFunction(f::Function)
    X = linspace(0.0, 1.0, 101)
    Y = f(X)
    return X, Y
end

# using anonymous function
#   x -> sin(2*π*x)
X, Y = giveMeYourFunction(x -> sin(2*π*x))

plot(X, Y, "g--*")

grid()
xlabel(L"$x$")
ylabel(L"$f(x)=\sin(2\,\pi\,x)$")
savefig("anonymous01.png")
println("file saved")
