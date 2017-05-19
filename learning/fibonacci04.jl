function fib(n)
    if n == 0
        return 0
    elseif n == 1
        return 1
    else
        return fib(n-2) + fib(n-1)
    end
end
N = [fib(n) for n=0:10]
println("N = ", N)
