# ninjabrain-bot Home Manager Module

Home Manager Module for [Ninjabrain-Bot](https://github.com/Ninjabrain1/Ninjabrain-Bot/) w/ [Stylix](https://github.com/nix-community/stylix/) support.

By default the package comes from [uku's mcsr-nixos flake](https://git.uku3lig.net/uku/mcsr-nixos/src/branch/main).

## Examples

todo! Expand these examples

```nix
# home.nix
{ inputs, ... }:
{
  imports = [ inputs.ninjabrain-bot-nix.homeModules.default ];

  programs.ninjabrain-bot = {
    enable = true;
    stylix = true;

    settings = {
      hotkey_increment = {
        key = 57421; # VC_RIGHT
      };
      hotkey_decrement = {
        key = 57419; # VC_LEFT
      };
      hotkey_reset = {
        key = 19; # VC_R
        modifiers = [ "ALT_L" ];
      };

      sensitivity_manual = 0.4341732;
      sigma = 0.1;
      resolution_height = 16384;
      # ...
    };
  };
}
```

## Home Manager Options

@docs@
