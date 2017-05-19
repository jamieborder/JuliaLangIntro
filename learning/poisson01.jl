using Distributions,StatsBase,PyPlot

λ = 2.0
distr = Poisson(λ)

N = 1000  # generate N points
data = [rand(distr) for _ in 1:N]

edges = 0:10
freq  = counts(data, 0:10)

bar(edges, freq,
    width=1.0, color="#cde4ec")
xlabel("edges")
ylabel("count")
savefig("poisson01a.png")

clf()
stem(edges, freq)
xlabel("values")
ylabel("count")
savefig("poisson01b.png")

println("figures saved")
