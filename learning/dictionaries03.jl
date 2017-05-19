grades = Dict("MATH1052" => 6, "ENGG1400" => 7, "CIVL2210" => 6,
              "CIVL2330" => 7, "CIVL3420" => 6, "CIVL2530" => 7)

println("has CIVL2210? ", haskey(grades, "CIVL2210")) # true
println("has CIVL4334? ", haskey(grades, "CIVL4334")) # false
println("all keys = ", keys(grades))

for (code, grade) in grades
    print("COURSE = $code, GRADE = $grade")
    if grade > 6
        print("   YAY!")
    end
    if code == "CIVL2530"
        print("   loved it!")
    end
    println()
end

delete!(grades, "CIVL2210")
println("all keys = ", keys(grades))
println("has CIVL2210? ", haskey(grades, "CIVL2210")) # false
