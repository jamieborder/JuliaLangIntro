A = [25.0 15.0 -5.0;
     15.0 18.0  0.0;
     -5.0  0.0 11.0]
CF = cholfact(A, :L)
L  = CF[:L]
println("A      = ", A)
println("L      = ", L)
println("L * L' = ", L * L')
println("error  = ", maximum(abs(L*L' - A)))

# MyCholesky returns the Cholesky decomposition of a symmetric positive-definite matrix:
#  a = L * trans(L)
function MyCholesky(a::Matrix{Float64})::Matrix{Float64}
    n = size(a)[1]
    L = zeros(n,n)
    for j in 1:n      # loop over columns
        for i in j:n  # loop over lower diagonal rows (and diag)
            amsum = a[i,j]
            for k in 1:j
                amsum -= L[i,k] * L[j,k]
            end
            if i == j
                if amsum <= 0.0
                    error("factorisation failed. non SPD matrix")
                end
                L[i,j] = sqrt(amsum)
            else
                L[i,j] = amsum / L[j,j]
            end
        end
    end
    return L
end

L = MyCholesky(A)
println("L (mine) = ", L)



function SPDsolve(a::Matrix{Float64}, b::Vector{Float64})::Vector{Float64}
    L = MyCholesky(a)
    n = size(a)[1]
    x = zeros(n)
    for i in 1:n # solve L*y = b storing y in x
        bmsum = b[i]
        for k in 1:i
            bmsum -= L[i,k] * x[k]
        end
        x[i] = bmsum / L[i,i]
    end
    for i in n:-1:1 # solve trans(L)*x = y with y==x
        bmsum = x[i]
        for k in i+1:n
            bmsum -= L[k,i] * x[k]
        end
        x[i] = bmsum / L[i,i]
    end
    return x
end

println()
println()

A = Float64[2 1 1 3 2;
            1 2 2 1 1;
            1 2 9 1 5;
            3 1 1 7 1;
            2 1 5 1 8]
b = Float64[-2, 4, 3, -5, 1]
x = SPDsolve(A, b)
println("A     = ", A)
println("b     = ", b)
println("error = ", maximum(abs(A * x - b)))
println("x     = ", x * 98.0)
