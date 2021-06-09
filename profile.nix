{
  mkDerivation, base, stdenv, dhall
}:
mkDerivation {
  pname = "project0";
  version = "1.0.0";
  src = ./.;
  # isLibrary = true;
  # isExecutable = true;
  # executableHaskellDepends = [ base unordered-containers lens ];
  # libraryHaskellDepends = [ base unordered-containers lens ];
  buildDepends = [ base dhall ];
  license = stdenv.lib.licenses.bsd3;
  enableLibraryProfiling = true;
}
