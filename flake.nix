
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      utils,
    }:
    utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
      in
      {
        devShell =
          with pkgs;
          mkShell {
            buildInputs = [
              # web
              bun

              # dev env
              fish
              gdb
            ];

            shellHook = ''
              export FOUNDRY_DISABLE_NIGHTLY_WARNING=1
              export IN_DEV_SHELL=1
              exec fish
            '';
          };
      }
    );
}
