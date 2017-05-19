numbers = Set([1,1,1,1,1,2,3,3])
println("numbers = ", numbers)

two = Set([2])
three = Set([3])
four = Set([4])

println(intersect(numbers, two))
println(intersect(numbers, three))
println(intersect(numbers, four))
println(union(numbers, four))
