nix-shell --attr env shell.nix --run "cabal --enable-profiling build --ghc-options=\"-fprof-auto -rtsopts -fPIC -fexternal-dynamic-refs\""