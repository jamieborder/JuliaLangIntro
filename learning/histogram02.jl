using StatsBase,PyPlot

data = [0, 0, 0, 0, 0,          # 5
		1, 1, 1, 1, 1, 1, 1, 1, # 8
		2, 2,                   # 2
		3, 3,                   # 2
        4, 4, 4]                # 3

edges = [0, 1, 2, 3, 4, 5]
freq  = counts(data, 0:5)

bar(edges, freq,
    width=1.0, color="#fde3b2")
xlabel("edges")
ylabel("count")
savefig("histogram02a.png")

clf()
stem(edges, freq)
xlabel("values")
ylabel("count")
savefig("histogram02b.png")

println("files saved")
