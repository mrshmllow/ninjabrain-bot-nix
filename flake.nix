{
  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    flake-compat.url = "https://git.lix.systems/lix-project/flake-compat/archive/main.tar.gz";
    git-hooks.url = "github:cachix/git-hooks.nix";
    systems.url = "github:nix-systems/default";
    crane.url = "github:ipetkov/crane";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    fenix.url = "github:nix-community/fenix";
    fenix.inputs.nixpkgs.follows = "nixpkgs";
    treefmt-nix.url = "github:numtide/treefmt-nix";
    home-manager.url = "github:nix-community/home-manager";
  };

  outputs =
    {
      self,
      flake-parts,
      systems,
      git-hooks,
      crane,
      treefmt-nix,
      home-manager,
      ...
    }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        git-hooks.flakeModule
        treefmt-nix.flakeModule
        home-manager.flakeModules.home-manager
        ./nix/hooks.nix # pre-commit hooks
        ./nix/shells.nix
      ];
      systems = import systems;

      flake.homeModules.default = import ./module.nix self;

      perSystem =
        {
          self',
          pkgs,
          inputs',
          config,
          lib,
          craneLib,
          commonArgs,
          ...
        }:
        {
          _module.args = {
            toolchain = inputs'.fenix.packages.complete;
            craneLib = (crane.mkLib pkgs).overrideToolchain config._module.args.toolchain.toolchain;

            commonArgs = {
              src = craneLib.cleanCargoSource ./serializer;
              strictDeps = true;
            };

            inherit self;
          };

          packages.default = craneLib.buildPackage (
            commonArgs
            // {
              src = craneLib.cleanCargoSource ./serializer;
              strictDeps = true;
              cargoArtifacts = craneLib.buildDepsOnly commonArgs;
            }
          );

          packages."options-md" =
            let
              modules = inputs.home-manager.lib.homeManagerConfiguration {
                inherit pkgs;
                modules = [
                  (import ./module.nix self)
                  {
                    home.username = "user";
                    home.homeDirectory = "/home/user";
                    home.stateVersion = "25.11";
                  }
                ];
              };

              options = pkgs.nixosOptionsDoc {
                options = {
                  programs.ninjabrain-bot = modules.options.programs.ninjabrain-bot;
                };

                warningsAreErrors = false;
              };
            in
            pkgs.runCommand "options-doc.md" { } ''
              sed '/\*Declared by:\*/,+1d' ${options.optionsCommonMark} | sed 's/^#/##/' > $out
            '';

          packages."readme-md" = pkgs.replaceVars ./README.template.md {
            docs = builtins.readFile self'.packages."options-md";
          };

          treefmt = {
            programs = {
              nixfmt.enable = true;
              rustfmt.enable = true;
              taplo.enable = true;
            };
          };
        };
    };
}
