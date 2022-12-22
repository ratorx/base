(import
  (
    let
      flake-compat = (builtins.fromJSON (builtins.readFile ./flake.lock)).nodes.flake-compat.locked;
    in
    fetchTarball {
      url = "https://github.com/${flake-compat.owner}/${flake-compat.repo}/archive/${flake-compat.rev}.tar.gz";
      sha256 = flake-compat.narHash;
    }
  )
  { src = ./.; }).defaultNix.devShells.${builtins.currentSystem}.default
