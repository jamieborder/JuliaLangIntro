using Distributions

fair_coin = Bernoulli()
biased_coin = Bernoulli(0.7)

N = 1000
a = [rand(fair_coin) for _ in 1:N]
b = [rand(biased_coin) for _ in 1:N]

println("fair coin flips = ", a)
println("biased coin flips = ", b)

using StatsBase

println("fair: number of heads = ", counts(a,1:1))
println("biased: number of heads = ", counts(b,1:1))
