{
  perSystem =
    {
      toolchain,
      config,
      lib,
      pkgs,
      ...
    }:
    {
      pre-commit = {
        settings = {
          hooks = {
            statix.enable = true;
            deadnix = {
              enable = true;
              settings.edit = true;
            };
            zizmor.enable = true;
            clippy = {
              enable = true;
              settings.extraArgs = "--tests";
              packageOverrides = {
                inherit (toolchain) cargo clippy;
              };
            };
            cargo-check = {
              enable = true;
              package = toolchain.cargo;
            };
            fmt = {
              enable = true;
              name = "nix fmt";
              entry = "${lib.getExe config.formatter} --no-cache";
            };
            machete = {
              enable = true;
              name = "cargo-machete";
              files = "\\.(rs|toml)$";
              entry = lib.getExe pkgs.cargo-machete;
            };
            typos = {
              enable = true;
              settings = {
                configPath = "typos.toml";
              };
            };

          };

        };

      };
    };

}
