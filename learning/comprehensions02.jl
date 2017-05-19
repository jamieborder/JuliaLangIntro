A = [1.1 1.2 1.3 1.4;
     2.1 2.2 2.3 2.4;
     3.1 3.2 3.3 3.4]

B = Float64[]
sz = size(A)
for j=1:sz[2]
    for i=1:sz[1]
        if i > 1 && j > 2
            push!(B, A[i,j])
        end
    end
end

C = [(i*10.0+j)/10.0 for i=1:3, j=1:4 if i > 1 && j > 2]

println("A = ", A)
println("B = ", B)
println("C = ", C)
