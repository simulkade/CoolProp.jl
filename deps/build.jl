# download the binaries from sourceforge
if is_linux()
  lib_coolprop_path=joinpath(Pkg.dir(), "CoolProp", "deps", "libCoolProp.so")
  if !isfile(lib_coolprop_path)
    download("https://sourceforge.net/projects/coolprop/files/CoolProp/6.1.0/shared_library/Linux/64bit/libCoolProp.so.6.1.0/download", 
    lib_coolprop_path)
  end
elseif is_windows()
  lib_coolprop_path=joinpath(Pkg.dir(), "CoolProp", "deps", "libCoolProp.dll")
  if !isfile()
    readall(`curl -L -o $lib_coolprop_path  https://sourceforge.net/projects/coolprop/files/CoolProp/6.1.0/shared_library/Windows/64bit/libCoolProp.dll/download`)
  end
elseif is_apple()
  lib_coolprop_path=joinpath(Pkg.dir(), "CoolProp", "deps", "libCoolProp.dylib")
  if !isfile(lib_coolprop_path)
    download("https://sourceforge.net/projects/coolprop/files/CoolProp/6.1.0/shared_library/Darwin/64bit/libCoolProp.dylib/download", 
    lib_coolprop_path)
  end
end
