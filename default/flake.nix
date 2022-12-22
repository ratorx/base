{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-major.minor";
  };
  outputs = { self, flake-utils, nixpkgs, ... }:
    let
      # Extend the nixpkgs lib with extra utilities
      # lib = nixpkgs.lib.extend (final: _: import ./lib.nix final);
    in
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = import nixpkgs { inherit system; }; in
      {
        formatter = pkgs.nixpkgs-fmt;
        devShells.default = pkgs.mkShell { nativeBuildInputs = [ pkgs.rnix-lsp ]; };
      }
    );
}
