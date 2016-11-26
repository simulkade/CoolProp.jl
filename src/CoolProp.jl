push!(Libdl.DL_LOAD_PATH, abspath(joinpath(@__FILE__,"..","..","deps")));
include("../deps/CoolProp.jl");
