push!(LOAD_PATH, ".")

using Geometry

A = Point(0.0,     0.0)
B = Point(2.0,     0.0)
C = Point(1.0, sqrt(3))
T = Triangle(A, B, C)
area = TriangleArea(T)
println("area = ", area)
