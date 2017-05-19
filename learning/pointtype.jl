type Point
    x::Float64
    y::Float64
end

function eatPointSpitPoint(A::Point)::Point
    B = Point(A.x, A.y)
    B.x += 123.0
    B.y -= 123.0
    return B
end

A = Point(456.0, 200.0)
B = eatPointSpitPoint(A)
println("point A:", A)
println("point B:", B)
