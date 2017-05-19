using StatsBase
using PyPlot

data = [1, 5, 1, 4,
        3, 6, 2, 2,
        4, 9, 8, 0,
        1, 4, 4, 4]

edges = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

h = fit(Histogram, data, edges, closed=:left)
println(h)

grid()
bar(edges[1:end-1], h.weights, width=1.0, color="#82a2ec")
xlabel("numbers")
ylabel("frequency")
savefig("histogram01.png")
prinln("histogram01.png saved")
