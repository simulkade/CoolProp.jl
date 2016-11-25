import JSON
const OS_ARCH_CoolProp = (Sys.WORD_SIZE == 64) ? "64bit" : "32bit__cdecl";
const srcpath = abspath(joinpath(@__FILE__,"..","..","src"));
const destpathbase = abspath(joinpath(@__FILE__,".."));
latestVersion_CoolProp = "";
_download(s, d) = isfile(d) ? throw("file exists ...") : begin
  info("Downloading $s => $d .")
  download(s, d);
  info("Done.");
end
try
  latestVersion_CoolProp = JSON.parse(readstring(download("https://sourceforge.net/projects/coolprop/best_release.json")))["release"]["filename"][11:15];
  println("CoolProp latestVersion = $latestVersion_CoolProp ...")
  coolpropurlbase = "http://netix.dl.sourceforge.net/project/coolprop/CoolProp/$latestVersion_CoolProp/";
  _download(coolpropurlbase * "Julia/CoolProp.jl", joinpath(srcpath, "CoolProp.jl"));
  info("I'm Getting CoolProp Binaries...");
  @static if is_windows()
    urlbase = coolpropurlbase * "shared_library/Windows/$OS_ARCH_CoolProp/";
    _download(joinpath(urlbase,"CoolProp.dll"), joinpath(destpathbase,"libCoolProp.dll"));
    _download(joinpath(urlbase,"CoolProp.lib"), joinpath(destpathbase,"libCoolProp.lib"));
    _download(joinpath(urlbase,"exports.txt"), joinpath(destpathbase,"exports.txt"));
  end
  @static if is_linux()
    urlbase = coolpropurlbase * "shared_library/Linux/64bit/libCoolProp.so.$latestVersion_CoolProp";
    _download(urlbase, joinpath(destpathbase,"libCoolProp.so"));
  end
  @static if is_apple()
    urlbase = coolpropurlbase * "shared_library/Darwin/64bit/libCoolProp.dylib.$latestVersion_CoolProp";
    _download(urlbase, joinpath(destpathbase,"libCoolProp.dylib"));
  end
catch err
  println("Build error: $err")
end
