using PyPlot

# single-expression function
f(x) = sin(2*π * x)

# or:
function g(x)
    return sin(2*π * x)
end

X = linspace(0.0, 1.0, 101)
plot(X, f(X), "r-")
plot(X, g(X), "b.")

grid()
xlabel(L"$x$")
ylabel(L"$f(x)=\sin(2\,\pi\,x)$")
savefig("morefunctions01.png")
println("file saved")
