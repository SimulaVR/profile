{
  mkDerivation, base, stdenv, dhall, cabal-install
}:
let

in
mkDerivation {
  pname = "MainNix";
  version = "1.0.0";
  src = ./.;
  # isLibrary = true;
  # isExecutable = true;
  # executableHaskellDepends = [ base unordered-containers lens ];
  # libraryHaskellDepends = [ base unordered-containers lens ];
  buildDepends = [ base dhall cabal-install ];
  license = stdenv.lib.licenses.bsd3;
  enableLibraryProfiling = true;
}
