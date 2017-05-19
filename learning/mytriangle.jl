export Triangle
export TriangleArea
export TriangleDraw

type Triangle
    A::Point
    B::Point
    C::Point
end

function TriangleArea(T::Triangle)::Float64
    f0 = T.B.x * T.C.y - T.C.x * T.B.y
    f1 = T.C.x * T.A.y - T.A.x * T.C.y
    f2 = T.A.x * T.B.y - T.B.x * T.A.y
    return (f0 + f1 + f2) / 2.0
end

function TriangleDraw(T::Triangle)
    X = [T.A.x, T.B.x, T.C.x, T.A.x]
    Y = [T.A.y, T.B.y, T.C.y, T.A.y]
    plot(X, Y)
end
