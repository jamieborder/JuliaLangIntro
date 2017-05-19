using PyPlot

type Point
    x::Float64
    y::Float64
end

type Triangle
    A::Point
    B::Point
    C::Point
end

function drawTriangle(T::Triangle)
    X = [T.A.x, T.B.x, T.C.x, T.A.x]
    Y = [T.A.y, T.B.y, T.C.y, T.A.y]
    T.A = T.B
    plot(X, Y)
end

A = Point(0.5, 0.5)
B = Point(1.5, 0.5)
C = Point(1.0, 1.0)

T = Triangle(A, B, C)
println("T.A = ", T.A)
println("T.B = ", T.B)
drawTriangle(T)
println("T.A = ", T.A)
println("T.B = ", T.B)

println("point A: x=", A.x, ", y=", A.y)

plot(A.x, A.y, "g*-", label="A")
plot(B.x, B.y, "bs-", label="B")
plot(C.x, C.y, "ro-", label="C")
legend()
savefig("userdefinedtypes01a.png")
println("file saved")
