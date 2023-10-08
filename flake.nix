{
  description = "terraform-tfe-workspace";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "aarch64-darwin" "aarch64-linux" "x86_64-darwin" "x86_64-linux" ];
      perSystem = { config, self', inputs', pkgs, system, ... }: {
        packages = {
          terraform-with-plugins = pkgs.terraform.withPlugins (ps: with ps; [
            tfe
          ]);

          default = pkgs.runCommand "default"
            {
              src = ./.;
            } ''
            mkdir -p $out
            cp -R $src/*.tf $out

            ${config.packages.terraform-with-plugins}/bin/terraform -chdir="$out" init
            ${config.packages.terraform-with-plugins}/bin/terraform -chdir="$out" validate
          '';
        };

        devShells = {
          default = pkgs.mkShell {
            buildInputs = with pkgs; [
              terraform
              terraform-docs
            ];
          };
        };
      };
    };
}
