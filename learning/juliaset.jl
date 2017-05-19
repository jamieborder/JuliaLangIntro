using PyPlot

function juliaset(x::Float64, y::Float64, cx::Float64, cy::Float64, K::Int64, lmax::Float64)::Int64
    for i in 1:K
        x2 = x * x
        y2 = y * y
        if x2 + y2 > lmax
            return i-1
        end
        y = 2*x*y + cy
        x = x2 - y2 + cx
    end
    return K
end

N    = 1000
cx   = -0.835
cy   = -0.2321
K    = 40
lmax = 4.0

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
        T[i,j] = juliaset(x, y, cx, cy, K, lmax)
    end
end

imshow(T)
show()
