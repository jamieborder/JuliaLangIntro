type Point
    x::Float64
    y::Float64
end

type Triangle
    A::Point
    B::Point
    C::Point
end

function triangleArea(T::Triangle)::Float64
    f0 = T.B.x * T.C.y - T.C.x * T.B.y
    f1 = T.C.x * T.A.y - T.A.x * T.C.y
    f2 = T.A.x * T.B.y - T.B.x * T.A.y
    return (f0 + f1 + f2) / 2.0
end

A = Point(0.0,     0.0)
B = Point(2.0,     0.0)
C = Point(1.0, sqrt(3))

T = Triangle(A, B, C)

area = triangleArea(T)

println("area = ", area)
