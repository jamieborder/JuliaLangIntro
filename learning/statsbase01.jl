using StatsBase

srand(2530)

a = [1,2,3,4,5]
s1 = sample(a)
println("a  = ", a)
println("s1 = ", s1)

w = weights([0.1, 0.6, 0.2, 0.1])
s2 = sample(a, w)
println("s2 = ", s2)

s3 = sample(w)
println("s3 = ", s3)

b = [0.1, 0.6, 0.2, 0.1]
s4 = sample(b)
println("s4 = ", s4)
