srand(2530)                   # initialises generator with given seed

x = rand()                    # generates one number between [0, 1)

n = rand([11,22,33,44,55])    # pick one number from the given list

N = rand([11,22,33,44,55], 8) # select 8 numbers from the given list

println("x = ", x)
println("n = ", n)
println("N = ", N)
