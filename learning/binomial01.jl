using Distributions,StatsBase,PyPlot

n = 10   # number of trials
p = 0.5  # p. of success of one trial
distr = Binomial(n, p)

N = 1000  # generate N points
data = [rand(distr) for _ in 1:N]

edges = 0:n
freq  = counts(data, 0:n)

bar(edges, freq,
    width=1.0, color="#f4afdb")
xlabel("edges")
ylabel("count")
savefig("binomial01a.png")

clf()
stem(edges, freq)
xlabel("values")
ylabel("count")
savefig("binomial01b.png")

println("figures saved")
