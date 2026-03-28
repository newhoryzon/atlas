{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            (python3.withPackages (ps: with ps; [
              mkdocs
              mkdocs-material
              mkdocs-git-revision-date-localized-plugin
              mkdocs-git-committers-plugin-2
            ]))
          ];
        };

        shellHook = ''
          if [ -f .env ]; then
            source .env
          fi
        '';
      }
    );
}