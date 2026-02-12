# ninjabrain-bot Home Manager Module

Home Manager Module for [Ninjabrain-Bot](https://github.com/Ninjabrain1/Ninjabrain-Bot/) w/ [Stylix](https://github.com/nix-community/stylix/) support.

By default the package comes from [uku's mcsr-nixos flake](https://git.uku3lig.net/uku/mcsr-nixos/src/branch/main).

## Examples

Todo

## Home Manager Options

### programs\.ninjabrain-bot\.enable



Whether to enable ninjabrain-bot\.



*Type:*
boolean



*Default:*

```nix
false
```



*Example:*

```nix
true
```



### programs\.ninjabrain-bot\.package



The ninjabrain-bot package to use\. Default’s to uku’s ninjabrain-bot package\. Setting to null will skip installing the package\.



*Type:*
null or package



*Default:*

```nix
mcsrPkgs.ninjabrain-bot
```



### programs\.ninjabrain-bot\.additional_custom_themes

List of custom themes\.
Obtaining a theme string is quite hard and it’s recommended you create one in the GUI first then copying it manually from the preferences file\.
Ninjabrain-bot separates themes by a ` . `\.



*Type:*
list of (submodule)



*Default:*

```nix
[ ]
```



### programs\.ninjabrain-bot\.additional_custom_themes\.\*\.name



Name of the theme\. Must not contain a ` . `



*Type:*
string matching the pattern ^\[^\.]\*$



### programs\.ninjabrain-bot\.additional_custom_themes\.\*\.value



Theme colours encoded string\. Find by creating the theme in the GUI then copying it from the preferences file\.
Must not contain a ` . `\.



*Type:*
string matching the pattern ^\[^\.]\*$



### programs\.ninjabrain-bot\.settings



Settings for ninjabrain-bot



*Type:*
submodule



*Default:*

```nix
{ }
```



### programs\.ninjabrain-bot\.settings\.enable_http_server



Enable the HTTP API server



*Type:*
boolean



*Default:*

```nix
false
```



### programs\.ninjabrain-bot\.settings\.aa_toggle_type



This option has no description\.



*Type:*
one of “automatic”, “hotkey”



*Default:*

```nix
"automatic"
```



### programs\.ninjabrain-bot\.settings\.all_advancements



This option has no description\.



*Type:*
boolean



*Default:*

```nix
false
```



### programs\.ninjabrain-bot\.settings\.alt_clipboard_reader



Whether or not to use the ‘alternative clipboard reader’



*Type:*
boolean



*Default:*

```nix
false
```



### programs\.ninjabrain-bot\.settings\.always_on_top



This option has no description\.



*Type:*
boolean



*Default:*

```nix
true
```



### programs\.ninjabrain-bot\.settings\.angle_adjustment_display_type



This option has no description\.



*Type:*
one of “angle_change”, “increments”



*Default:*

```nix
"angle_change"
```



### programs\.ninjabrain-bot\.settings\.angle_adjustment_type



This option has no description\.



*Type:*
one of “subpixel”, “tall”, “custom”



*Default:*

```nix
"subpixel"
```



### programs\.ninjabrain-bot\.settings\.auto_reset



Automatically reset the calculator after some period of time\.



*Type:*
boolean



*Default:*

```nix
false
```



### programs\.ninjabrain-bot\.settings\.auto_reset_on_instance_change



This option has no description\.



*Type:*
boolean



*Default:*

```nix
false
```



### programs\.ninjabrain-bot\.settings\.boat_error



This option has no description\.



*Type:*
integer or floating point number between 0 and 0\.7 (both inclusive)



*Default:*

```nix
0.03
```



### programs\.ninjabrain-bot\.settings\.check_for_updates



This option has no description\.



*Type:*
boolean



*Default:*

```nix
true
```



### programs\.ninjabrain-bot\.settings\.color_negative_coords



This option has no description\.



*Type:*
boolean



*Default:*

```nix
false
```



### programs\.ninjabrain-bot\.settings\.combined_offset_information_enabled



This option has no description\.



*Type:*
boolean



*Default:*

```nix
true
```



### programs\.ninjabrain-bot\.settings\.crosshair_correction



This option has no description\.



*Type:*
integer or floating point number between -1 and 1 (both inclusive)



*Default:*

```nix
0
```



### programs\.ninjabrain-bot\.settings\.custom_adjustment



This option has no description\.



*Type:*
integer or floating point number between 0 and 1 (both inclusive)



*Default:*

```nix
0.01
```



### programs\.ninjabrain-bot\.settings\.default_boat_type



This option has no description\.



*Type:*
one of “gray”, “blue”, “green”



*Default:*

```nix
"gray"
```



### programs\.ninjabrain-bot\.settings\.direction_help_enabled



This option has no description\.



*Type:*
boolean



*Default:*

```nix
false
```



### programs\.ninjabrain-bot\.settings\.language_v2



Language code\. Leave to default for the system language\.



*Type:*
string



*Default:*

```nix
""
```



### programs\.ninjabrain-bot\.settings\.mc_version



This option has no description\.



*Type:*
one of “pre_119”, “post_119”



*Default:*

```nix
"pre_119"
```



### programs\.ninjabrain-bot\.settings\.mismeasure_warning_enabled



This option has no description\.



*Type:*
boolean



*Default:*

```nix
false
```



### programs\.ninjabrain-bot\.settings\.one_dot_twenty_plus_aa



This option has no description\.



*Type:*
boolean



*Default:*

```nix
false
```



### programs\.ninjabrain-bot\.settings\.overlay_auto_hide



This option has no description\.



*Type:*
boolean



*Default:*

```nix
false
```



### programs\.ninjabrain-bot\.settings\.overlay_hide_delay



This option has no description\.



*Type:*
integer or floating point number between 1 and 3600 (both inclusive)



*Default:*

```nix
30.0
```



### programs\.ninjabrain-bot\.settings\.overlay_lock_hide



This option has no description\.



*Type:*
boolean



*Default:*

```nix
false
```



### programs\.ninjabrain-bot\.settings\.portal_linking_warning_enabled



This option has no description\.



*Type:*
boolean



*Default:*

```nix
true
```



### programs\.ninjabrain-bot\.settings\.resolution_height



This option has no description\.



*Type:*
integer or floating point number between 1 and 16384 (both inclusive)



*Default:*

```nix
16384
```



### programs\.ninjabrain-bot\.settings\.save_state



This option has no description\.



*Type:*
boolean



*Default:*

```nix
true
```



### programs\.ninjabrain-bot\.settings\.sensitivity



This option has no description\.



*Type:*
integer or floating point number between 0 and 1 (both inclusive)



*Default:*

```nix
0.012727597
```



### programs\.ninjabrain-bot\.settings\.sensitivity_manual



This option has no description\.



*Type:*
integer or floating point number between 0 and 1 (both inclusive)



*Default:*

```nix
0.4341732
```



### programs\.ninjabrain-bot\.settings\.show_angle_errors



This option has no description\.



*Type:*
boolean



*Default:*

```nix
false
```



### programs\.ninjabrain-bot\.settings\.show_angle_updates



This option has no description\.



*Type:*
boolean



*Default:*

```nix
false
```



### programs\.ninjabrain-bot\.settings\.show_nether_coords



This option has no description\.



*Type:*
boolean



*Default:*

```nix
true
```



### programs\.ninjabrain-bot\.settings\.sigma



This option has no description\.



*Type:*
integer or floating point number between 0\.001 and 1 (both inclusive)



*Default:*

```nix
0.1
```



### programs\.ninjabrain-bot\.settings\.sigma_alt



This option has no description\.



*Type:*
integer or floating point number between 0\.001 and 1 (both inclusive)



*Default:*

```nix
0.1
```



### programs\.ninjabrain-bot\.settings\.sigma_boat



This option has no description\.



*Type:*
integer or floating point number between 0\.0001 and 1 (both inclusive)



*Default:*

```nix
0.001
```



### programs\.ninjabrain-bot\.settings\.sigma_manual



This option has no description\.



*Type:*
integer or floating point number between 0\.001 and 1 (both inclusive)



*Default:*

```nix
0.03
```



### programs\.ninjabrain-bot\.settings\.size



This option has no description\.



*Type:*
one of “small”, “medium”, “large”



*Default:*

```nix
"small"
```



### programs\.ninjabrain-bot\.settings\.stronghold_display_type



This option has no description\.



*Type:*
one of “fourfour”, “eighteight”, “chunk”



*Default:*

```nix
"fourfour"
```



### programs\.ninjabrain-bot\.settings\.theme



Theme index\.
Positive values refer to the builtin themes that come with ninjabrain bot\.
Negative values refer to custom themes, backwards\. ` -1 ` would refer to the first custom theme, ` -2 ` the second, and so on\.



*Type:*
signed integer



*Default:*

```nix
1
```



### programs\.ninjabrain-bot\.settings\.translucent



This option has no description\.



*Type:*
boolean



*Default:*

```nix
false
```



### programs\.ninjabrain-bot\.settings\.use_adv_statistics



This option has no description\.



*Type:*
boolean



*Default:*

```nix
true
```



### programs\.ninjabrain-bot\.settings\.use_alt_std



This option has no description\.



*Type:*
boolean



*Default:*

```nix
false
```



### programs\.ninjabrain-bot\.settings\.use_obs_overlay



This option has no description\.



*Type:*
boolean



*Default:*

```nix
false
```



### programs\.ninjabrain-bot\.settings\.use_precise_angle



This option has no description\.



*Type:*
boolean



*Default:*

```nix
false
```



### programs\.ninjabrain-bot\.settings\.view



This option has no description\.



*Type:*
one of “basic”, “detailed”



*Default:*

```nix
"basic"
```



### programs\.ninjabrain-bot\.settings\.window_x



Window X position



*Type:*
signed integer



*Default:*

```nix
100
```



### programs\.ninjabrain-bot\.settings\.window_y



Window Y position



*Type:*
signed integer



*Default:*

```nix
100
```



### programs\.ninjabrain-bot\.stylix



Whether to enable style ninjabrain bot\.



*Type:*
boolean



*Default:*

```nix
false
```



*Example:*

```nix
true
```



