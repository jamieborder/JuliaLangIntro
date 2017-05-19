using Distributions,StatsBase,PyPlot

μ, σ = 2.0, 1.0
distr = LogNormal(μ, σ)

N = 5000  # generate N points
data = [rand(distr) for _ in 1:N]

edges = 0.5:20
h = fit(Histogram, data, edges, closed=:left)

bar(edges[1:end-1], h.weights,
    width=1.0, color="#fbeedb")
xlabel("edges")
ylabel("count")
savefig("lognormal01a.png")

clf()
x = linspace(0.5, 20, 101)
plot(x, pdf(distr,x))
xlabel("values")
ylabel("pdf")
savefig("lognormal01b.png")

println("figures saved")
