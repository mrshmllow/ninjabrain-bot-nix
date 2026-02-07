self:
{
  config,
  pkgs,
  lib,
  ...
}:
let
  cfg = config.programs.ninjabrain-bot;

  mkNinbLines =
    settings:
    lib.concatLines (
      lib.mapAttrsToList (k: v: "<entry key=\"${k}\" value=\"${toString v}\"/>") settings
    );

  stylix_theme =
    lib.pipe
      (pkgs.runCommand "generate-ninb-theme" { } ''
        cat ${config.lib.stylix.colors.outPath} | ${
          lib.getExe' self.packages.${pkgs.system}.default "serializer"
        } > $out
      '')
      [
        (builtins.readFile)
        (lib.escapeXML)
      ];
in
{
  options.programs.ninjabrain-bot = {
    enable = lib.mkEnableOption "ninjabrain-bot";
    stylix = lib.mkEnableOption "style ninjabrain bot";

    additional_custom_themes = lib.mkOption {
      type = lib.types.listOf lib.types.attrsOf (
        lib.types.submodule {
          options = {
            name = lib.mkOption {
              type = lib.types.strMatching "^[^.]*$";
            };
            value = lib.mkOption {
              type = lib.types.strMatching "^[^.]*$";
            };
          };
        }
      );
      default = [ ];
      description = "List of custom theme strings. Ninjabrain bot seperates these by a `.`";
    };

    settings = lib.mkOption {
      type = lib.types.attrsOf (
        lib.types.submodule {
          options = {
            theme = lib.mkOption {
              type = lib.types.int;
              description = ''
                Theme index. 
                Positive values refer to the builtin themes that come with ninjabrain bot.
              '';
              default = if cfg.stylix then -1 else 1;
            };

            custom_themes = lib.mkOption {
              type = lib.types.str;
              default = (
                lib.join "." (
                  (map (x: x.value) cfg.additional_custom_themes) ++ (lib.optional cfg.stylix stylix_theme)
                )
              );
            };

            custom_themes_names = lib.mkOption {
              type = lib.types.str;
              default = (
                lib.join "." ((map (x: x.name) cfg.additional_custom_themes) ++ (lib.optional "Stylix"))
              );
            };

            settings_version = lib.mkOption {
              type = lib.types.ints.positive;
              default = 2;
              internal = true;
              visible = false;
            };

            sensitivity_manual = lib.mkOption {
              type = lib.types.numbers.between 0 1;
              default = 0.4341732;
            };

            sigma = lib.mkOption {
              type = lib.types.numbers.between 0.001 1;
              default = 0.1;
            };

            sigma_alt = lib.mkOption {
              type = lib.types.numbers.between 0.001 1;
              default = 0.1;
            };

            sigma_manual = lib.mkOption {
              type = lib.types.numbers.between 0.001 1;
              default = 0.03;
            };

            sigma_boat = lib.mkOption {
              type = lib.types.numbers.between 0.0001 1;
              default = 0.001;
            };

            resolution_height = lib.mkOption {
              type = lib.types.numbers.between 1 16384;
              default = 16384;
            };

            boat_error = lib.mkOption {
              type = lib.types.numbers.between 0 0.7;
              default = 0.03;
            };

            overlay_hide_delay = lib.mkOption {
              type = lib.types.numbers.between 1 3600;
              default = 30;
            };

            sensitivity = lib.mkOption {
              type = lib.types.numbers.between 0 1;
              default = 0.012727597;
            };

            custom_adjustment = lib.mkOption {
              type = lib.types.numbers.between 0 1;
              default = 0.01;
            };

            crosshair_correction = lib.mkOption {
              type = lib.types.numbers.between - 1 1;
              default = 0;
            };

            check_for_updates = lib.mkOption {
              type = lib.types.bool;
              default = true;
            };
            translucent = lib.mkOption {
              type = lib.types.bool;
              default = false;
            };
            always_on_top = lib.mkOption {
              type = lib.types.bool;
              default = true;
            };
            show_nether_coords = lib.mkOption {
              type = lib.types.bool;
              default = true;
            };
            show_angle_updates = lib.mkOption {
              type = lib.types.bool;
              default = false;
            };
            show_angle_errors = lib.mkOption {
              type = lib.types.bool;
              default = false;
            };
            auto_reset = lib.mkOption {
              type = lib.types.bool;
              default = false;
            };
            auto_reset_on_instance_change = lib.mkOption {
              type = lib.types.bool;
              default = false;
            };
            use_adv_statistics = lib.mkOption {
              type = lib.types.bool;
              default = true;
            };
            alt_clipboard_reader = lib.mkOption {
              type = lib.types.bool;
              default = false;
            };
            use_alt_std = lib.mkOption {
              type = lib.types.bool;
              default = false;
            };
            color_negative_coords = lib.mkOption {
              type = lib.types.bool;
              default = false;
            };
            use_precise_angle = lib.mkOption {
              type = lib.types.bool;
              default = false;
            };
            use_obs_overlay = lib.mkOption {
              type = lib.types.bool;
              default = false;
            };
            save_state = lib.mkOption {
              type = lib.types.bool;
              default = true;
            };
            enable_http_server = lib.mkOption {
              type = lib.types.bool;
              default = false;
            };
            overlay_auto_hide = lib.mkOption {
              type = lib.types.bool;
              default = false;
            };
            overlay_lock_hide = lib.mkOption {
              type = lib.types.bool;
              default = false;
            };
            all_advancements = lib.mkOption {
              type = lib.types.bool;
              default = false;
            };
            one_dot_twenty_plus_aa = lib.mkOption {
              type = lib.types.bool;
              default = false;
            };
            mismeasure_warning_enabled = lib.mkOption {
              type = lib.types.bool;
              default = false;
            };
            direction_help_enabled = lib.mkOption {
              type = lib.types.bool;
              default = false;
            };
            combined_offset_information_enabled = lib.mkOption {
              type = lib.types.bool;
              default = true;
            };
            portal_linking_warning_enabled = lib.mkOption {
              type = lib.types.bool;
              default = true;
            };
          };
        }
      );
    };
  };

  config = lib.mkMerge [
    (lib.mkIf cfg.enable {
      home.file.".java/.userPrefs/ninjabrainbot/prefs.xml".text = ''
        <?xml version="1.0" encoding="UTF-8" standalone="no"?>
        <!DOCTYPE map SYSTEM "http://java.sun.com/dtd/preferences.dtd">
        <map MAP_XML_VERSION="1.0">
      ''
      + (mkNinbLines cfg.settings)
      + ''
        </map>
      '';
    })
  ];
}
