v = [1, 2, 3, 4]
try
    v[5] = 5
catch e
    println("caught an error: $e")
end

println("notice that this code still works")
println("i.e. this line is executed")
println("v = $v")
