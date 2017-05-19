codes = ["MATH1052", "ENGG1400", "CIVL2210",
         "CIVL2330", "CIVL3420", "CIVL2530"]

map = Dict()

for (index, code) in enumerate(codes)
    map["id_$index"] = code
end

println("map[id_1] = ", map["id_1"])
println("map[id_2] = ", map["id_2"])
println("map[id_3] = ", map["id_3"])
println("map[id_4] = ", map["id_4"])
println("map[id_5] = ", map["id_5"])
println("map[id_6] = ", map["id_6"])

println(keys(map))
println(values(map))
