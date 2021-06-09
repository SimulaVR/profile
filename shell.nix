{ }:
let
  overlays = (import ./profileOverlays.nix);
  pkgs = import  ./pinned-nixpkgs.nix { overlays = overlays; };

  haskellCallPkg = if profileBuild then (pkgs.haskellPackagesPIC.callPackage) else (haskellPackages.callPackage);
  haskellCallPkgNoProfile = pkgs.haskellPackages.callPackage;
  Cabal = haskellCallPkgNoProfile ./submodules/cabal/Cabal/Cabal.nix { };
  hackage-security = haskellPackages.hackage-security.override { Cabal = Cabal; };
  cabal-install = haskellCallPkgNoProfile ./submodules/cabal/cabal-install/cabal-install.nix { Cabal = Cabal; hackage-security = hackage-security; };

  main = (pkgs.haskellPackagesPIC.callPackage) ./Main.nix { cabal-install = cabal-install; };

  # ourCabal = stdenv.mkDerivation {
  #   name = "ourCabal";
  #   src =  ./.;
  #   buildInputs = [ cabal-install ];
  #   installPhase = ''
  #   mkdir -p $out/bin
  #   ln -s ${cabal-install}/bin/cabal$out/bin/cabal
  #   '';
  # };

in main;
