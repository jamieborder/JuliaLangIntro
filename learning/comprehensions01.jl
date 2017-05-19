A = [1.1 1.2 1.3 1.4;
     2.1 2.2 2.3 2.4;
     3.1 3.2 3.3 3.4]

B = [(i*10.0+j)/10.0 for i=1:3, j=1:4]

C = A - B

println("A =", A)
println("B =", B)
println(C)
