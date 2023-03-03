{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-major.minor";
  };
  outputs = { self, flake-utils, nixpkgs, ... }:
    let
      # Extend the nixpkgs lib with extra utilities
      # lib = nixpkgs.lib.extend (final: _: import ./lib.nix final);
    in
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        formatter = pkgs.nixpkgs-fmt;
      in
      {
        inherit formatter;
        devShells.default = pkgs.mkShell {
          packages = [ pkgs.nil formatter ];
        };
      }
    );
}
