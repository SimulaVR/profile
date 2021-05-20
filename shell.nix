{ }:
let
  overlays = [
      (self: super: {
        haskellPackagesPIC = super.haskell.packages."ghc8104".override {
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
    ];
    pkgs = import  ./pinned-nixpkgs.nix { overlays = overlays; };
in
  (pkgs.haskellPackagesPIC.callPackage) ./profile.nix { }
