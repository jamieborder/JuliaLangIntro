type Point
    x::Float64
    y::Float64
end

type Answer
    fx::Float64
    ok::Bool
end

function SegInterp(x::Float64, a::Point, b::Point)::Answer
    ans = Answer(0.0, false)
    if x < a.x || x > b.x
        return ans
    end
    ans.fx = a.y + (x - a.x) * (b.y - a.y) / (b.x - a.x)
    ans.ok = true
    return ans
end

function LinInterp(x::Float64, pts::Array{Point})::Answer
    ans = Answer(0.0, false)
    np = length(pts)
    if np < 2
        return ans
    end
    for i in 2:np
        println(i)
    end
    return ans
end
