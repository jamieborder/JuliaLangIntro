export Point
export PointDrawWithLabel

type Point
    x::Float64
    y::Float64
end

function PointDrawWithLabel(p::Point, label::String)
    plot(p.x, p.y, "ro")
    text(p.x, p.y, label)
end
