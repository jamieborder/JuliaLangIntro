v = Float64[1, 2, 3, 4]

function scalarFunction(x::Float64)::Float64
    return x * 10.0
end

# println(scalarFunction(v)) # <<< error
# no method matching scalarFunction(::Array{Float64,1})

println(scalarFunction.(v))
