using BlockDecomposition

using Test
using JuMP

const BD = BlockDecomposition

function test_annotation(ann::BD.Annotation, F::Type{<:BD.Formulation}, 
        D::Type{<:BD.Decomposition}, minmult, maxmult)
    @test BD.getformulation(ann) == F
    @test BD.getdecomposition(ann) == D
    @test BD.getlowermultiplicity(ann) == minmult
    @test BD.getuppermultiplicity(ann) == maxmult
    id = BD.getid(ann)
    @test repr(ann) == "Annotation($(F), $(D), lm = $(float(minmult)), um = $(float(maxmult)), id = $(id))"
    return
end

include("axis.jl")
include("containers.jl")
include("formulations.jl")
include("dantzigwolfe.jl")
include("benders.jl")
include("assignsolver.jl")
include("automatic_dantzig_wolfe.jl")
include("branchingpriority.jl")
include("customdata.jl")
include("soldisaggregation.jl")

axis_declarations()
test_JuMP_containers()
test_dantzig_wolfe_different()
test_automatic_dantzig_wolfe()
test_dantzig_wolfe_identical()
test_dummy_model_decompositions()
test_benders()
test_assignsolver()
test_branching_priority()
test_custom_data()
test_sol_disagg()
