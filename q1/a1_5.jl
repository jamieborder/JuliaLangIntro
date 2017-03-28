# CIVL2530 Assignment 1 Question 5
# Author: Dorival Pedroso
# Date: 16/03/2017

function juliaset(x::Float64, y::Float64, cx::Float64, cy::Float64)::Int64
    k = 1
    while x^2 + y^2 <= 4 && k <= 50
        t = y
        y = 2.0*x*y + cy
        x = x*x - t*t + cx
        k += 1
    end
    return k
end

cx = -0.835
cy = -0.2321

N = 1000
xmin = -2.0
xmax =  2.0
ymin = -2.0
ymax =  2.0

dx = (xmax - xmin) / N
dy = (ymax - ymin) / N

T = zeros(N, N)
for i in 1:N
    for j in 1:N
        x = xmin + i * dx
        y = ymin + j * dy
        T[i,j] = juliaset(x, y, cx, cy)
    end
end

using PyPlot
imshow(T)
savefig("a1_5.png")
