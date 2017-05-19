using Distributions,StatsBase,PyPlot

μ, σ = -2.0, 1.0
distr = Normal(μ, σ)

N = 1000  # generate N points
data = [rand(distr) for _ in 1:N]

edges = -6:2
h = fit(Histogram, data, edges, closed=:left)

bar(edges[1:end-1], h.weights,
    width=1.0, color="#fbdbe5")
xlabel("edges")
ylabel("count")
savefig("normal01a.png")

clf()
x = linspace(-6, 2, 101)
plot(x, pdf(distr,x))
xlabel("values")
ylabel("pdf")
savefig("normal01b.png")

println("figures saved")
