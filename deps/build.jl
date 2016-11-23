# download the binaries from sourceforge
using BinDeps
if is_linux()
  lib_coolprop_path=joinpath(Pkg.dir(), "CoolProp", "deps", "libCoolProp.so")
  if !isfile(lib_coolprop_path)
    info("libCoolProp.so does not exist. Downloading the library from source forge...")
    download("https://sourceforge.net/projects/coolprop/files/CoolProp/6.1.0/shared_library/Linux/64bit/libCoolProp.so.6.1.0/download", 
    lib_coolprop_path)
  end
elseif is_windows()
  lib_coolprop_path=joinpath(Pkg.dir(), "CoolProp", "deps", "libCoolProp.dll")
  if !isfile(lib_coolprop_path)
    info("libCoolProp.dll does not exist. Downloading the library from source forge...")
    #readall(`curl -L -o $lib_coolprop_path  https://sourceforge.net/projects/coolprop/files/CoolProp/6.1.0/shared_library/Windows/64bit/libCoolProp.dll/download`)
    lib_coolprop_win_url="https://sourceforge.net/projects/coolprop/files/CoolProp/6.1.0/shared_library/Windows/64bit/libCoolProp.dll/download"
    readall(BinDeps.download_cmd(lib_coolprop_win_url, lib_coolprop_path))
  end
elseif is_apple()
  lib_coolprop_path=joinpath(Pkg.dir(), "CoolProp", "deps", "libCoolProp.dylib")
  if !isfile(lib_coolprop_path)
    info("libCoolProp.dylib does not exist. Downloading the library from source forge...")
    download("https://sourceforge.net/projects/coolprop/files/CoolProp/6.1.0/shared_library/Darwin/64bit/libCoolProp.dylib/download", 
    lib_coolprop_path)
  end
end
