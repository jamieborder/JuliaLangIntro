using Distributions,StatsBase,PyPlot

a, b = -4, 8
distr = DiscreteUniform(a, b)

N = 1000
data = [rand(distr) for _ in 1:N]

edges = a:b
freq  = counts(data, a:b)

bar(edges, freq,
    width=1.0, color="#aff4b9")
xlabel("edges")
ylabel("count")
savefig("discreteuniform01a.png")

clf()
stem(edges, freq)
xlabel("values")
ylabel("count")
savefig("discreteuniform01b.png")

println("discreteuniform01.png saved")
