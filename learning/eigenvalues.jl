A = Float64[2 0 0;
            0 3 4;
            0 4 9]
EF = eigfact(A)
println(EF[:values])
println(EF[:vectors])
