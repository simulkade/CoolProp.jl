using CoolProp
using Base.Test
@test (CoolProp.PropsSI("T","P",101325.0,"Q",0.0,"Water")-373.1242958476879)<1e-5
# See https://github.com/CoolProp/CoolProp/issues/1293
for param in ["version", "gitrevision", "errstring", "warnstring", "incompressible_list_pure", "incompressible_list_solution", "predefined_mixtures", "HOME"]
  println(param * " = " * get_global_param_string(param))
end
