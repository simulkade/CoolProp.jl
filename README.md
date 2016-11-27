[![Build Status](https://travis-ci.org/DANA-Laboratory/CoolProp.jl.svg?branch=master)](https://travis-ci.org/DANA-Laboratory/CoolProp.jl)

# JCoolprop
A Julia wrapper for CoolProp (http://www.coolprop.org)

This is not my work, and all the credit goes to the cool [CoolProp contributors](https://github.com/CoolProp/CoolProp/graphs/contributors). I only put this together to make things easier for a friend of mine.  

## Installation
```julia
Pkg.clone("https://github.com/simulkade/CoolProp.jl.git")
Pkg.build("CoolProp") # to download the binaries
```

## Note
The installer downloads libraries only for 64 bit operating systems. I have tested it on my Linux machine and it works fine. Please let me know if it does not work for you. As an alternative, you can download the binaries for your OS from [here](https://sourceforge.net/projects/coolprop/files/CoolProp/6.1.0/shared_library/)
