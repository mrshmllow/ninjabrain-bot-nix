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

  getTheme = builtins.readFile (
    pkgs.runCommand "generate-ninb-theme" { } ''
      cat ${config.lib.stylix.colors.outPath} | ${
        lib.getExe' self.packages.${pkgs.system}.default "serializer"
      } > $out
    ''
  );
in
{
  options.programs.ninjabrain-bot = {
    enable = lib.mkEnableOption "ninjabrain-bot";
    stylix = lib.mkEnableOption "style ninjabrain bot";
    settings = lib.mkOption {
      type = lib.types.attrsOf (
        lib.types.submodule {
          options = {
            # angle_adjustment_display_type = 1;
            # angle_adjustment_type = 1;
            # color_negative_coords = true;
            # default_boat_type = 2;
            # hotkey_decrement_code = 50;
            # hotkey_decrement_modifier = 2;
            # hotkey_increment_code = 51;
            # hotkey_increment_modifier = 2;
            # hotkey_reset_code = 19;
            # hotkey_reset_modifier = 3;
            # language_v2 = "en-US";
            # overlay_auto_hide = true;
            # overlay_hide_delay = 60;
            # sensitivity = "0.02291165";
            # sensitivity_manual = "0.02291165";
            # settings_version = 2;
            # show_angle_errors = true;
            # show_angle_updates = true;
            # sigma_boat = "0.0007";
            # size = 1;
            # theme = 1;
            # translucent = false;
            # use_obs_overlay = true;
            # use_precise_angle = true;
            # view = 1;
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
      + (mkNinbLines ({
        custom_themes = getTheme;
        custom_themes_names = "Stylix";
        theme = "-1";
      }))
      + ''
        </map>
      '';
    })
  ];
}
