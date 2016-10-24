using CoolProp
using Base.Test
@test (CoolProp.PropsSI("T","P",101325.0,"Q",0.0,"Water")-373.1242958476879)<1e-5
