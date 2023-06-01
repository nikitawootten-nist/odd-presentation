{
  description = "Environment for the fedramp databites presentation";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    infra.url = "github:nikitawootten/infra";
  };

  outputs = { self, nixpkgs, infra }: {
    devShells = nixpkgs.lib.genAttrs
      [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ]
      (system:
        let
          pkgs = import nixpkgs { inherit system; };
        in
        {
          default = pkgs.mkShell {
            name = "fr-databites";
            packages = [
              infra.packages.${system}.oscal-cli
              infra.packages.${system}.oscal-deep-diff
              pkgs.gnumake
              pkgs.nodejs_20
            ];
          };
        }
      );
  };
}
