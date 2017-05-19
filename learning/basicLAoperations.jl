a = [1.0, 2.0, 3.0]
b = [3.0, 2.0, 1.0]
println(a + b)
println(a - b)
println(a + 0.5)
println(-2.0 * a)

println(dot(a,b))
println(1*3 + 2*2 + 3*1.0)

a = [3.0, 4.0, 12.0]
println()
println(norm(a))
println(sqrt(3*3 + 4*4 + 12*12))

b = [3.0, 14.0, 18.0]
println(b - a)

a = [1.0, 1.0, 1.0]
b = [1.0, -1.0, 0.0]
println(acos(dot(a,b)/(norm(a)*norm(b)))*180.0/pi)

a = [1.0, 1.0, 1.0]
b = [1.0, -1.0, 0.0]
println(cross(a,b))
