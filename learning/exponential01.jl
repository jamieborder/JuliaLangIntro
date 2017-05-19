using Distributions,StatsBase,PyPlot

θ = 1.0
distr = Exponential(θ)

N = 1000  # generate N points
data = [rand(distr) for _ in 1:N]

edges = 0:8
h = fit(Histogram, data, edges, closed=:left)

bar(edges[1:end-1], h.weights,
    width=1.0, color="#dbfbdf")
xlabel("edges")
ylabel("count")
savefig("exponential01a.png")

clf()
x = linspace(0, 8, 101)
plot(x, pdf(distr,x))
xlabel("values")
ylabel("pdf")
savefig("exponential01b.png")

println("figures saved")
