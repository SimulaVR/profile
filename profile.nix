{
  mkDerivation, base, stdenv, unordered-containers, lens
}:
mkDerivation {
  pname = "project0";
  version = "1.0.0";
  src = ./.;
  # isLibrary = true;
  # isExecutable = true;
  # executableHaskellDepends = [ base unordered-containers lens ];
  # libraryHaskellDepends = [ base unordered-containers lens ];
  buildDepends = [ base unordered-containers lens ];
  license = stdenv.lib.licenses.bsd3;
  enableLibraryProfiling = true;
}
