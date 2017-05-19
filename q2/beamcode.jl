# Copyright 2017 The CIVL2530 Authors. All rights reserved.
# Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file.

# Support holds information about beam support
##############################################
type Support

    # input
    Type::String # e.g. fixed, pin, roller, none
    X::Float64   # position along beam

    # computed
    DI::Int     # degree of indeterminancy added by this support
    Ry::Float64 # y-reaction
    Mr::Float64 # moment-reaction
end

# NewSupport creates a new support
#   Input:
#     L    -- length of Beam
#     Type -- type of support: fixed, pin, roller, none
#     X    -- position along beam
#   Output:
#     a new Support object
function NewSupport(L::Float64, Type::String, X::Float64)::Support
    if X < 0 || X > L
        throw("support is outside beam")
    end
    o = Support(Type, X, 0, 0, 0)
    if Type == "fixed"
        o.DI += 3
    elseif Type == "pin"
        o.DI += 2
    elseif Type == "roller"
        o.DI += 1
    elseif Type == "none"
        # OK
    else
        throw("support type ($Type) is invalid")
    end
    return o
end

# SupportSummary prints summary about support
#   Input:
#     o      -- handle of Support object
#     prefix -- a small text to prefix each printed variable
function SupportSummary(o::Support, prefix::String)
    println(prefix * "Type = ", o.Type)
    println(prefix * "X    = ", o.X)
    println(prefix * "DI   = ", o.DI)
    println(prefix * "Ry   = ", o.Ry)
    println(prefix * "Mr   = ", o.Mr)
end



# PointLoad holds information about point (concentrated) loads (PLs)
####################################################################
type PointLoad
    P::Float64 # load value (-) means downwards, (+) means upwards. e.g -10 kN
    X::Float64 # position along beam (e.g. 1 m)
end

# NewPointLoad returns a new PointLoad
#   Input:
#     L -- length of beam
#     P -- point load value (-) means downwards, (+) means upwards
#     X -- position along beam
#   Output:
#     a new PointLoad object
function NewPointLoad(L::Float64, P::Float64, X::Float64)::PointLoad
    if X < 0 || X > L
        throw("point load is outside beam")
    end
    return PointLoad(P, X)
end

# PointLoadSummary prints a summary of PointLoad data
#   Input:
#     o      -- handle of PointLoad object
#     prefix -- a small text to prefix each printed variable
function PointLoadSummary(o::PointLoad, prefix::String)
    println(prefix * "P = ", o.P)
    println(prefix * "X = ", o.X)
end



# Beam holds information about simply supported beam
####################################################
type Beam

    # essential
    L::Float64     # length of beam
    A::Float64     # cross-sectional area
    Gamma::Float64 # unit weight of material

    # computed
    W::Float64  # weight
    Xc::Float64 # centroid

    # supports and loads
    Lsup::Support             # left support
    Rsup::Support             # right support
    Loads::Array{PointLoad,1} # point loads
end

# NewBeam returns a new Beam
#   Input:
#     L          -- length of beam
#     A          -- cross sectional area
#     Gamma      -- unit weight of material; e.g. 24 N/m³
#     selfWeight -- computes self-weight or not
#   Output:
#     a new beam object
function NewBeam(L::Float64, A::Float64, Gamma::Float64, selfWeight::Bool)::Beam
    o = Beam(L, A, Gamma, L*A*Gamma, L/2.0, NewSupport(L, "pin", 0.0), NewSupport(L, "roller", L), [])
    if selfWeight
        push!(o.Loads, NewPointLoad(L, -o.W, o.Xc))
    end
    return o
end

# BeamSetSupport sets support of beam
#   Input:
#     o     -- handle of Beam object
#     right -- set right support instead of left [default is left]
#     Type  -- type of support
#     X     -- position of support along beam
#   Output:
#     the beam object (o) will be modified
function BeamSetSupport(o::Beam, right::Bool, Type::String, X::Float64)
    if right
        o.Rsup = NewSupport(o.L, Type, X)
    else
        o.Lsup = NewSupport(o.L, Type, X)
    end
end

# BeamAddPointLoad adds point load to Beam
#   Input:
#     o -- handle of Beam object
#     P -- point load value (-) means downwards, (+) means upwards
#     X -- position of point load along beam
#   Output:
#     the beam object (o) will be modified
function BeamAddPointLoad(o::Beam, P::Float64, X::Float64)
    push!(o.Loads, NewPointLoad(o.L, P, X))
end

# BeamAddUniDistLoad adds uniformly distributed load (UDL) to Beam
#   Input:
#     o      -- handle of Beam object
#     load   -- distributed load value (e.g. kN/m) (-) points down, (+) points up
#     startX -- distance from left of UDL
#     length -- length of UDL
#   Output:
#     the beam object (o) will be modified
function BeamAddUniDistLoad(o::Beam, load::Float64, startX::Float64, length::Float64)
    if startX + length > o.L
        throw("distributed load is outside beam")
    end
    BeamAddPointLoad(o, length*load, startX+length/2.0)
end

# BeamReactions computes reactions at supports
#   Input:
#     o -- handle of Beam object
#   Output:
#     the beam object (o) will be modified
#     the results will be stored in o.Lsup and o.Rsup (left and right supports)
function BeamReactions(o::Beam)
    
    # compute degree of indeterminancy
    di = o.Lsup.DI + o.Rsup.DI
    if di != 3
        throw("cannot solve indetermined beam. DI=$di")
    end

    # sumMa = Σ Pi * (xi - xa)
    sumMa = 0.0
    if o.Lsup.Type != "none"
        xa = o.Lsup.X
        for i in 1:length(o.Loads)
            Pi = o.Loads[i].P
            xi = o.Loads[i].X
            sumMa += Pi * (xi - xa)
        end
    end

    # sumMb = Σ Pi * (xi - xb)
    sumMb = 0.0
    if o.Rsup.Type != "none"
        xb = o.Rsup.X
        for i in 1:length(o.Loads)
            Pi = o.Loads[i].P
            xi = o.Loads[i].X
            sumMb += Pi * (xi - xb)
        end
    end

    # case A: simply supported beam
    if o.Lsup.Type != "fixed" && o.Rsup.Type != "fixed"
        xa = o.Lsup.X
        xb = o.Rsup.X
        Rb = - sumMa / (xb - xa)
        Ra = - sumMb / (xa - xb)
        o.Lsup.Ry = Ra
        o.Rsup.Ry = Rb
        return # make sure to return here
    end

    # sumP = Σ Pi
    sumP = 0.0
    for i in 1:length(o.Loads)
        Pi = o.Loads[i].P
        sumP += Pi
    end

    # case B: cantilever. support @ left
    if o.Lsup.Type == "fixed"
        o.Lsup.Ry = - sumP
        o.Lsup.Mr = sumMa
    end

    # case B: cantilever. support @ right
    if o.Rsup.Type == "fixed"
        o.Rsup.Ry = - sumP
        o.Rsup.Mr = sumMb
    end
end

# BeamSummary prints a summary of Beam data
#   Input:
#     o -- handle of Beam object
function BeamSummary(o::Beam, description::String)
    println("=======================================")
    println(" Beam: $description")
    println("---------------------------------------")
    println(" Length               = ", o.L)
    println(" Cross-sectional Area = ", o.A)
    println(" Material unit weight = ", o.Gamma)
    println(" Weight               = ", o.W)
    println(" Centroid             = ", o.Xc)
    println(" Degree of indeterm.  = ", o.Lsup.DI + o.Rsup.DI)
    println(" Supports:")
    if o.Lsup.Type != "none"
        println("     left:")
        SupportSummary(o.Lsup, "         ")
    end
    if o.Rsup.Type != "none"
        println("     right:")
        SupportSummary(o.Rsup, "         ")
    end
    println(" Point Loads:")
    for i in 1:length(o.Loads)
        println("    $i")
        PointLoadSummary(o.Loads[i], "        ")
    end
    println("=======================================")
end



### tests #########################################################

# checkFloat checks whether two float point numbers are equal or not (within tolerance)
function checkFloat(name::String, tolerance::Float64, u::Float64, v::Float64)
    if abs(u - v) > tolerance
        throw("$name: u and v are different")
    end
    println("$name is OK")
end

# test 1
b1 = NewBeam(1.2, 0.0, 0.0, false)
BeamSetSupport(b1, false, "pin", 0.4)
BeamSetSupport(b1, true, "roller", 1.2)
BeamAddPointLoad(b1, -20.0, 0.0)
BeamAddPointLoad(b1, -15.0, 0.6)
BeamAddPointLoad(b1, -30.0, 1.0)
BeamReactions(b1)
BeamSummary(b1, "test 1")
println()
checkFloat("Ra", 1e-14, b1.Lsup.Ry, 48.75)
checkFloat("Rb", 1e-14, b1.Rsup.Ry, 16.25)
println()

# test 2
b2 = NewBeam(1.2, 0.0, 0.0, false)
BeamSetSupport(b2, false, "roller", 0.0)
BeamSetSupport(b2, true, "pin", 0.8)
BeamAddPointLoad(b2, -30.0, 0.2)
BeamAddPointLoad(b2, -15.0, 0.6)
BeamAddPointLoad(b2, -20.0, 1.2)
BeamReactions(b2)
BeamSummary(b2, "test 2")
println()
checkFloat("Ra", 1e-14, b2.Lsup.Ry, 16.25)
checkFloat("Rb", 1e-14, b2.Rsup.Ry, 48.75)
println()

# test 3
b3 = NewBeam(4.0, 0.0, 0.0, false)
BeamSetSupport(b3, false, "fixed", 0.0)
BeamSetSupport(b3, true, "none", 4.0)
BeamAddPointLoad(b3, -30.0, 1.0)
BeamAddPointLoad(b3, -20.0, 3.0)
BeamAddPointLoad(b3, -10.0, 4.0)
BeamReactions(b3)
BeamSummary(b3, "test 3")
println()
checkFloat("Ra", 1e-14, b3.Lsup.Ry, 60.0)
checkFloat("Mr", 1e-14, b3.Lsup.Mr, -130.0)
println()

# test 4
b4 = NewBeam(4.0, 0.0, 0.0, false)
BeamSetSupport(b4, false, "none", 0.0)
BeamSetSupport(b4, true, "fixed", 4.0)
BeamAddPointLoad(b4, -10.0, 0.0)
BeamAddPointLoad(b4, -20.0, 1.0)
BeamAddPointLoad(b4, -30.0, 3.0)
BeamReactions(b4)
BeamSummary(b4, "test 4")
println()
checkFloat("Rb", 1e-14, b4.Rsup.Ry, 60.0)
checkFloat("Mr", 1e-14, b4.Rsup.Mr, +130.0)
println()

# test 5
b5 = NewBeam(1.2, 0.01, 1250.0, true)
BeamAddPointLoad(b5, -35.0, 0.4)
BeamAddPointLoad(b5, -20.0, 0.8)
BeamReactions(b5)
BeamSummary(b5, "test 5")
println()
checkFloat("Ra", 1e-14, b5.Lsup.Ry, 37.5)
checkFloat("Rb", 1e-14, b5.Rsup.Ry, 32.5)
println()
