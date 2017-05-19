v = [1, 2, 3]
println(Diagonal(v))

A = [1 2 3;
     4 5 6;
     7 8 9]
println(Diagonal(A))


A = [4.0 3.0;
     6.0 3.0]
L, U, p = lu(A)
println("L = ", L)
println("U = ", U)
println("p = ", p)
println("L * U  = ", L*U)
println("A[p,:] = ", A[p,:])
