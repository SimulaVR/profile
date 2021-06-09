[
    (self: super: {
      haskellPackagesPIC = super.haskell.packages."ghc8104profile".override {
        overrides = self: super: { ghc = super.ghc.override { enableRelocatedStaticLibs = true; enableProfiledLibs = true;}; };
      };
    })
    (self: super: {
      haskellPackagesPIC = super.haskellPackagesPIC.override (old: {
        overrides = super.lib.composeExtensions (old.overrides or (_: _: {}))
          (hself: hsuper: {
            mkDerivation = x: (hsuper.mkDerivation x).override (old: {
              enableLibraryProfiling = true;
              doCheck = false;
              configureFlags = (old.configureFlags or []) ++ ["--ghc-options=-fPIC -fexternal-dynamic-refs"];
            });
          });
      });
    })
  ]