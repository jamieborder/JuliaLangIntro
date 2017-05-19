#          C    E
data = [0.30 0.10;
        0.15 0.05;
        0.10 0.05;
        0.06 0.04;
        0.04 0.01;
        0.07 0.03]

sumC = sum(data[:,1])
sumE = sum(data[:,2])

sum1 = sum(data[1,:])
sum2 = sum(data[2,:])
sum3 = sum(data[3,:])
sum4 = sum(data[4,:])
sum5 = sum(data[5,:])

sumVert = sum(data,1)
sumHorz = sum(data,2)

sumAll = sum(data)

println("sumC = ", sumC)
println("sumE = ", sumE)
println()

println("sum1 = ", sum1)
println("sum2 = ", sum2)
println("sum3 = ", sum3)
println("sum4 = ", sum4)
println("sum5 = ", sum5)
println()

println("sumVert = ", sumVert)
println("sumHorz = ", sumHorz)

println("sumAll = ", sumAll)


P_E1 = sum(sumHorz[5:,1])
