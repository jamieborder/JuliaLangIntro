using StatsBase
srand(2530)
w = weights([0.1, 0.6, 0.2, 0.1])

N = 10
S = Int[]
for _ in 1:N       # the same as 'for i in 1:100'
    s = sample(w)  #    but we won't use 'i', so
    push!(S, s)    #    it's common to ignore it
end                #    by means of the underscore

c = counts(S, 1:4) # count the number of times 1,2,3,4
                   #   appear in S. returns an array
                   #   where the position corresponds
                   #   to 1,2,3,4

println("S = ", S)
println("c = ", c)

OnesFlags = Int[]
TwosFlags = Int[]
for i in 1:N        # now we want the index
    s = sample(w)
    S[i] = s
    f1 = s == 1
    f2 = s == 2
    push!(OnesFlags, f1)
    push!(TwosFlags, f2)
end

numberOfOnes = sum(OnesFlags)
numberOfTwos = sum(TwosFlags)

println()
println("S = ", S)
println("OnesFlags = ", OnesFlags)
println("TwosFlags = ", TwosFlags)
println("numberOfOnes = ", numberOfOnes)
println("numberOfTwos = ", numberOfTwos)

numberOfOnes = sum([sample(w) == 1  for _ in 1:N])
numberOfTwos = sum([sample(w) == 2  for _ in 1:N])
