# ninjabrain-bot Home Manager Module

Home Manager Module for [Ninjabrain-Bot](https://github.com/Ninjabrain1/Ninjabrain-Bot/) w/ [Stylix](https://github.com/nix-community/stylix/) support.

By default the package comes from [uku's mcsr-nixos flake](https://git.uku3lig.net/uku/mcsr-nixos/src/branch/main).

## Examples

This can be used as a flake as:

```nix
inputs = {
    ninjabrain-bot = {
      url = "https://tangled.org/althaea.zone/ninjabrain-bot-nix/archive/trunk";
    };
};
```

Here is an example configuration:

```nix
# home.nix
{ inputs, ... }:
{
  imports = [ inputs.ninjabrain-bot.homeModules.default ];

  programs.ninjabrain-bot = {
    enable = true;
    stylix = true;
    settings = {
      hotkey_decrement.key = 57419; # "right"
      hotkey_increment.key = 57421; # "left"

      hotkey_lock.key = 23; # "i"
      hotkey_reset = {
        key = 19; # "r"
        modifiers = [ "ALT_L" ];
      };

      view = "detailed";
      all_advancements = false;
      mc_version = "pre_119";
      sensitivity = 0.02291165;

      default_boat_type = "green";
      alt_clipboard_reader = false;
      angle_adjustment_display_type = "increments";
      angle_adjustment_type = "tall";
      auto_reset = false;
      color_negative_coords = false;
      direction_help_enabled = true;
      show_angle_errors = true;
      show_angle_updates = true;
      sigma_boat = 0.0007;
      stronghold_display_type = "fourfour";
      use_adv_statistics = true;
      use_precise_angle = true;

      enable_http_server = true;
    };
  };
}
```

## Home Manager Options

@docs@
