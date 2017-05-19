N = Int[0,1]
for i=2:10
    push!(N, N[i-1] + N[i])
end
println("N = ", N)
