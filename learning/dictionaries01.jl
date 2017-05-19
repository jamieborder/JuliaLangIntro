data = Dict("agent" => "steve", "tool" => "diamod_pickaxe",
            "phone" => 12345678, "color" => (255,255,0),
            (0,0,0) => "origin", (50,64,123) => "home")

println("agent       = ", data["agent"])
println("tool        = ", data["tool"])
println("phone       = ", data["phone"])
println("color       = ", data["color"])
println("(0,0,0)     = ", data[(0,0,0)])
println("(50,64,123) = ", data[(50,64,123)])
