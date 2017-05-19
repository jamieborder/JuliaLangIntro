include("LinInterp.jl")

using Base.Test

@testset "testing SegInterp with some numbers" begin
    a = Point(0.0, 0.0)
    b = Point(1.0, 1.0)
    ans1 = SegInterp(0.5, a, b)
    @test ans1.ok
    @test ans1.fx == 0.5

    c = Point(2.0, 60.0)
    d = Point(3.0, 68.0)
    ans2 = SegInterp(2.6, c, d)
    @test ans2.ok
    @test ans2.fx == 64.8
end

@testset "testing now LinInterp with some points" begin
    pts = [Point(0.0,0.0),
           Point(1.0,20.0),
           Point(2.0,60.0),
           Point(3.0,68.0),
           Point(4.0,77.0),
           Point(5.0,110.0)]
    ans = LinInterp(2.6, pts)
    @test ans.ok
    @test ans.fx == 64.8
end
