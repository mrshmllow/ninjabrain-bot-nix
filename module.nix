{ self, inputs }:
{
  config,
  pkgs,
  lib,
  ...
}:
let
  # values from https://javadoc.io/doc/com.1stleg/jnativehook/2.0.2/constant-values.html
  MODIFIER_MASKS = {
    ALT_L = 8;
    ALT_R = 128;
    CTRL_L = 2;
    CTRL_R = 32;
    META_L = 4;
    META_R = 64;
    SHIFT_L = 1;
    SHIFT_R = 16;
  };

  cfg = config.programs.ninjabrain-bot;

  # filters null & expands hotkeys into two attributes
  hotkeyExpandedSettings =
    let
      expandHotkey = name: value: {
        "${name}_code" = value.key;
        "${name}_modifier" = value.modifiers;
      };
    in
    lib.concatMapAttrs (
      name: value:
      if builtins.isNull value then
        { }
      else if (builtins.isAttrs value) && (value ? "key") then
        expandHotkey name value
      else
        lib.nameValuePair name value
    ) cfg.settings;

  mkNinbLines =
    settings:
    lib.concatLines (
      lib.mapAttrsToList (k: v: "<entry key=\"${k}\" value=\"${toString v}\"/>") settings
    );

  mkStylixTheme =
    lib.pipe
      (pkgs.runCommand "generate-ninb-theme" { } ''
        cat ${config.lib.stylix.colors.outPath} | ${
          lib.getExe' self.packages.${pkgs.stdenv.hostPlatform.system}.serializer "serializer"
        } > $out
      '')
      [
        builtins.readFile
        lib.escapeXML
      ];

  mkEnumOption =
    enum: default:
    lib.mkOption {
      inherit default;
      type = lib.types.enum enum;
      apply = value: lib.lists.findFirstIndex (x: x == value) 0 enum;
    };

  mkHotkeyOption =
    name:
    lib.mkOption {
      description = "Hotkey for ${name}";
      default = null;
      type = lib.types.nullOr (
        lib.types.submodule {
          options = {
            modifiers = lib.mkOption {
              type = lib.types.listOf (
                lib.types.enum [
                  "ALT_L"
                  "ALT_R"
                  "CTRL_L"
                  "CTRL_R"
                  "META_L"
                  "META_R"
                  "SHIFT_L"
                  "SHIFT_R"
                ]
              );
              default = [ ];
              description = "List of modifier keys.";
              # bitwise or of all the values summed together
              apply = list: builtins.foldl' (acc: element: builtins.bitOr acc MODIFIER_MASKS.${element}) 0 list;
            };
            key = lib.mkOption {
              type = lib.types.int;
              description = "Integer keycode.";
            };
          };
        }
      );
    };
in
{
  options.programs.ninjabrain-bot = {
    enable = lib.mkEnableOption "ninjabrain-bot";
    package =
      lib.mkPackageOption inputs.mcsr-nixos.packages.${pkgs.stdenv.hostPlatform.system} "ninjabrain-bot"
        {
          extraDescription = "Default's to uku's ninjabrain-bot package. Setting to null will skip installing the package.";
          nullable = true;
          pkgsText = "mcsrPkgs";
        };

    stylix = lib.mkEnableOption "style ninjabrain bot";

    additional_custom_themes = lib.mkOption {
      type = lib.types.listOf (
        lib.types.submodule {
          options = {
            name = lib.mkOption {
              type = lib.types.strMatching "^[^.]*$";
              description = "Name of the theme. Must not contain a `.`";
            };
            value = lib.mkOption {
              type = lib.types.strMatching "^[^.]*$";
              description = ''
                Theme colours encoded string. Find by creating the theme in the GUI then copying it from the preferences file.
                Must not contain a `.`.
              '';
            };
          };
        }
      );
      default = [ ];
      description = ''
        List of custom themes.
        Obtaining a theme string is quite hard and it's recommended you create one in the GUI first then copying it manually from the preferences file.
        Ninjabrain-bot separates themes by a `.`.
      '';
    };

    settings = lib.mkOption {
      default = { };
      description = "Settings for ninjabrain-bot";
      type = lib.types.submodule {
        options = {
          theme = lib.mkOption {
            type = lib.types.int;
            description = ''
              Theme index.
              Positive values refer to the builtin themes that come with ninjabrain bot.
              Negative values refer to custom themes, backwards. `-1` would refer to the first custom theme, `-2` the second, and so on.
            '';
            default = if cfg.stylix then -1 else 1;
          };

          custom_themes = lib.mkOption {
            type = lib.types.str;
            internal = true;
            visible = false;
            default = lib.join "." (
              (map (x: x.value) cfg.additional_custom_themes) ++ (lib.optional cfg.stylix mkStylixTheme)
            );
          };

          custom_themes_names = lib.mkOption {
            type = lib.types.str;
            internal = true;
            visible = false;
            default = lib.join "." (
              (map (x: x.name) cfg.additional_custom_themes) ++ (lib.optional cfg.stylix "Stylix")
            );
          };

          settings_version = lib.mkOption {
            type = lib.types.ints.positive;
            default = 3;
            internal = true;
            visible = false;
          };

          window_x = lib.mkOption {
            type = lib.types.int;
            default = 100;
            description = "Window X position";
          };

          window_y = lib.mkOption {
            type = lib.types.int;
            default = 100;
            description = "Window Y position";
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
            default = 30.0;
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
            type = lib.types.numbers.between (-1) 1;
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
            description = "Automatically reset the calculator after some period of time.";
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
            description = "Whether or not to use the 'alternative clipboard reader'";
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
            description = "Enable the HTTP API server";
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

          language_v2 = lib.mkOption {
            description = "Language code. Leave to default for the system language.";
            type = lib.types.str;
            default = "";
          };

          size = mkEnumOption [ "small" "medium" "large" ] "small";
          stronghold_display_type = mkEnumOption [ "fourfour" "eighteight" "chunk" ] "fourfour";
          view = mkEnumOption [ "basic" "detailed" ] "basic";
          mc_version = mkEnumOption [ "pre_119" "post_119" ] "pre_119";
          aa_toggle_type = mkEnumOption [ "automatic" "hotkey" ] "automatic";
          default_boat_type = mkEnumOption [ "gray" "blue" "green" ] "gray";
          angle_adjustment_type = mkEnumOption [ "subpixel" "tall" "custom" ] "subpixel";
          angle_adjustment_display_type = mkEnumOption [ "angle_change" "increments" ] "angle_change";

          hotkey_increment = mkHotkeyOption "increment";
          hotkey_decrement = mkHotkeyOption "decrement";
          hotkey_reset = mkHotkeyOption "reset";
          hotkey_undo = mkHotkeyOption "undo";
          hotkey_redo = mkHotkeyOption "redo";
          hotkey_minimize = mkHotkeyOption "minimize";
          hotkey_alt_std = mkHotkeyOption "alt_std";
          hotkey_lock = mkHotkeyOption "lock";
          hotkey_boat = mkHotkeyOption "boat";
          hotkey_mod_360 = mkHotkeyOption "mod_360";
          hotkey_toggle_aa_mode = mkHotkeyOption "toggle_aa_mode";
        };
      };
    };
  };

  config = lib.mkMerge [
    (lib.mkIf cfg.enable {
      home.file.".java/.userPrefs/ninjabrainbot/prefs.xml".text = ''
        <?xml version="1.0" encoding="UTF-8" standalone="no"?>
        <!DOCTYPE map SYSTEM "http://java.sun.com/dtd/preferences.dtd">
        <map MAP_XML_VERSION="1.0">
      ''
      + (mkNinbLines hotkeyExpandedSettings)
      + ''
        </map>
      '';
    })

    (lib.mkIf (!(builtins.isNull cfg.package)) {
      home.packages = [ cfg.package ];
    })
  ];
}
