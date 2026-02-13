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



### programs\.ninjabrain-bot\.settings\.hotkey_alt_std



Hotkey for alt_std



*Type:*
null or (submodule)



*Default:*

```nix
null
```



### programs\.ninjabrain-bot\.settings\.hotkey_alt_std\.key



Integer keycode\.

These can be obtained by finding the key from the list of constants at https://javadoc\.io/doc/com\.1stleg/jnativehook/2\.0\.2/constant-values\.html\.

For example, the key “A” corresponds to the field “VC_A”, which has the value 30, so you should set this value to 30\.

The key “R” would correspond to “VC_R”, F6 to “VC_F6”, etc\.



*Type:*
signed integer



*Example:*

```nix
19
```



### programs\.ninjabrain-bot\.settings\.hotkey_alt_std\.location



The location of the key\.

If you want to refer to ‘0’ on your numpad, you would set this value to NUMPAD\. Most of the time, STANDARD is what you want\.



*Type:*
one of “STANDARD”, “RIGHT”, “NUMPAD”, “LEFT”, “UNKNOWN”



*Default:*

```nix
"STANDARD"
```



### programs\.ninjabrain-bot\.settings\.hotkey_alt_std\.modifiers



List of modifier keys\.



*Type:*
list of (one of “ALT_L”, “ALT_R”, “CTRL_L”, “CTRL_R”, “META_L”, “META_R”, “SHIFT_L”, “SHIFT_R”)



*Default:*

```nix
[ ]
```



*Example:*

```nix
[
  "CTRL_L"
]
```



### programs\.ninjabrain-bot\.settings\.hotkey_boat



Hotkey for boat



*Type:*
null or (submodule)



*Default:*

```nix
null
```



### programs\.ninjabrain-bot\.settings\.hotkey_boat\.key



Integer keycode\.

These can be obtained by finding the key from the list of constants at https://javadoc\.io/doc/com\.1stleg/jnativehook/2\.0\.2/constant-values\.html\.

For example, the key “A” corresponds to the field “VC_A”, which has the value 30, so you should set this value to 30\.

The key “R” would correspond to “VC_R”, F6 to “VC_F6”, etc\.



*Type:*
signed integer



*Example:*

```nix
19
```



### programs\.ninjabrain-bot\.settings\.hotkey_boat\.location



The location of the key\.

If you want to refer to ‘0’ on your numpad, you would set this value to NUMPAD\. Most of the time, STANDARD is what you want\.



*Type:*
one of “STANDARD”, “RIGHT”, “NUMPAD”, “LEFT”, “UNKNOWN”



*Default:*

```nix
"STANDARD"
```



### programs\.ninjabrain-bot\.settings\.hotkey_boat\.modifiers



List of modifier keys\.



*Type:*
list of (one of “ALT_L”, “ALT_R”, “CTRL_L”, “CTRL_R”, “META_L”, “META_R”, “SHIFT_L”, “SHIFT_R”)



*Default:*

```nix
[ ]
```



*Example:*

```nix
[
  "CTRL_L"
]
```



### programs\.ninjabrain-bot\.settings\.hotkey_decrement



Hotkey for decrement



*Type:*
null or (submodule)



*Default:*

```nix
null
```



### programs\.ninjabrain-bot\.settings\.hotkey_decrement\.key



Integer keycode\.

These can be obtained by finding the key from the list of constants at https://javadoc\.io/doc/com\.1stleg/jnativehook/2\.0\.2/constant-values\.html\.

For example, the key “A” corresponds to the field “VC_A”, which has the value 30, so you should set this value to 30\.

The key “R” would correspond to “VC_R”, F6 to “VC_F6”, etc\.



*Type:*
signed integer



*Example:*

```nix
19
```



### programs\.ninjabrain-bot\.settings\.hotkey_decrement\.location



The location of the key\.

If you want to refer to ‘0’ on your numpad, you would set this value to NUMPAD\. Most of the time, STANDARD is what you want\.



*Type:*
one of “STANDARD”, “RIGHT”, “NUMPAD”, “LEFT”, “UNKNOWN”



*Default:*

```nix
"STANDARD"
```



### programs\.ninjabrain-bot\.settings\.hotkey_decrement\.modifiers



List of modifier keys\.



*Type:*
list of (one of “ALT_L”, “ALT_R”, “CTRL_L”, “CTRL_R”, “META_L”, “META_R”, “SHIFT_L”, “SHIFT_R”)



*Default:*

```nix
[ ]
```



*Example:*

```nix
[
  "CTRL_L"
]
```



### programs\.ninjabrain-bot\.settings\.hotkey_increment



Hotkey for increment



*Type:*
null or (submodule)



*Default:*

```nix
null
```



### programs\.ninjabrain-bot\.settings\.hotkey_increment\.key



Integer keycode\.

These can be obtained by finding the key from the list of constants at https://javadoc\.io/doc/com\.1stleg/jnativehook/2\.0\.2/constant-values\.html\.

For example, the key “A” corresponds to the field “VC_A”, which has the value 30, so you should set this value to 30\.

The key “R” would correspond to “VC_R”, F6 to “VC_F6”, etc\.



*Type:*
signed integer



*Example:*

```nix
19
```



### programs\.ninjabrain-bot\.settings\.hotkey_increment\.location



The location of the key\.

If you want to refer to ‘0’ on your numpad, you would set this value to NUMPAD\. Most of the time, STANDARD is what you want\.



*Type:*
one of “STANDARD”, “RIGHT”, “NUMPAD”, “LEFT”, “UNKNOWN”



*Default:*

```nix
"STANDARD"
```



### programs\.ninjabrain-bot\.settings\.hotkey_increment\.modifiers



List of modifier keys\.



*Type:*
list of (one of “ALT_L”, “ALT_R”, “CTRL_L”, “CTRL_R”, “META_L”, “META_R”, “SHIFT_L”, “SHIFT_R”)



*Default:*

```nix
[ ]
```



*Example:*

```nix
[
  "CTRL_L"
]
```



### programs\.ninjabrain-bot\.settings\.hotkey_lock



Hotkey for lock



*Type:*
null or (submodule)



*Default:*

```nix
null
```



### programs\.ninjabrain-bot\.settings\.hotkey_lock\.key



Integer keycode\.

These can be obtained by finding the key from the list of constants at https://javadoc\.io/doc/com\.1stleg/jnativehook/2\.0\.2/constant-values\.html\.

For example, the key “A” corresponds to the field “VC_A”, which has the value 30, so you should set this value to 30\.

The key “R” would correspond to “VC_R”, F6 to “VC_F6”, etc\.



*Type:*
signed integer



*Example:*

```nix
19
```



### programs\.ninjabrain-bot\.settings\.hotkey_lock\.location



The location of the key\.

If you want to refer to ‘0’ on your numpad, you would set this value to NUMPAD\. Most of the time, STANDARD is what you want\.



*Type:*
one of “STANDARD”, “RIGHT”, “NUMPAD”, “LEFT”, “UNKNOWN”



*Default:*

```nix
"STANDARD"
```



### programs\.ninjabrain-bot\.settings\.hotkey_lock\.modifiers



List of modifier keys\.



*Type:*
list of (one of “ALT_L”, “ALT_R”, “CTRL_L”, “CTRL_R”, “META_L”, “META_R”, “SHIFT_L”, “SHIFT_R”)



*Default:*

```nix
[ ]
```



*Example:*

```nix
[
  "CTRL_L"
]
```



### programs\.ninjabrain-bot\.settings\.hotkey_minimize



Hotkey for minimize



*Type:*
null or (submodule)



*Default:*

```nix
null
```



### programs\.ninjabrain-bot\.settings\.hotkey_minimize\.key



Integer keycode\.

These can be obtained by finding the key from the list of constants at https://javadoc\.io/doc/com\.1stleg/jnativehook/2\.0\.2/constant-values\.html\.

For example, the key “A” corresponds to the field “VC_A”, which has the value 30, so you should set this value to 30\.

The key “R” would correspond to “VC_R”, F6 to “VC_F6”, etc\.



*Type:*
signed integer



*Example:*

```nix
19
```



### programs\.ninjabrain-bot\.settings\.hotkey_minimize\.location



The location of the key\.

If you want to refer to ‘0’ on your numpad, you would set this value to NUMPAD\. Most of the time, STANDARD is what you want\.



*Type:*
one of “STANDARD”, “RIGHT”, “NUMPAD”, “LEFT”, “UNKNOWN”



*Default:*

```nix
"STANDARD"
```



### programs\.ninjabrain-bot\.settings\.hotkey_minimize\.modifiers



List of modifier keys\.



*Type:*
list of (one of “ALT_L”, “ALT_R”, “CTRL_L”, “CTRL_R”, “META_L”, “META_R”, “SHIFT_L”, “SHIFT_R”)



*Default:*

```nix
[ ]
```



*Example:*

```nix
[
  "CTRL_L"
]
```



### programs\.ninjabrain-bot\.settings\.hotkey_mod_360



Hotkey for mod_360



*Type:*
null or (submodule)



*Default:*

```nix
null
```



### programs\.ninjabrain-bot\.settings\.hotkey_mod_360\.key



Integer keycode\.

These can be obtained by finding the key from the list of constants at https://javadoc\.io/doc/com\.1stleg/jnativehook/2\.0\.2/constant-values\.html\.

For example, the key “A” corresponds to the field “VC_A”, which has the value 30, so you should set this value to 30\.

The key “R” would correspond to “VC_R”, F6 to “VC_F6”, etc\.



*Type:*
signed integer



*Example:*

```nix
19
```



### programs\.ninjabrain-bot\.settings\.hotkey_mod_360\.location



The location of the key\.

If you want to refer to ‘0’ on your numpad, you would set this value to NUMPAD\. Most of the time, STANDARD is what you want\.



*Type:*
one of “STANDARD”, “RIGHT”, “NUMPAD”, “LEFT”, “UNKNOWN”



*Default:*

```nix
"STANDARD"
```



### programs\.ninjabrain-bot\.settings\.hotkey_mod_360\.modifiers



List of modifier keys\.



*Type:*
list of (one of “ALT_L”, “ALT_R”, “CTRL_L”, “CTRL_R”, “META_L”, “META_R”, “SHIFT_L”, “SHIFT_R”)



*Default:*

```nix
[ ]
```



*Example:*

```nix
[
  "CTRL_L"
]
```



### programs\.ninjabrain-bot\.settings\.hotkey_redo



Hotkey for redo



*Type:*
null or (submodule)



*Default:*

```nix
null
```



### programs\.ninjabrain-bot\.settings\.hotkey_redo\.key



Integer keycode\.

These can be obtained by finding the key from the list of constants at https://javadoc\.io/doc/com\.1stleg/jnativehook/2\.0\.2/constant-values\.html\.

For example, the key “A” corresponds to the field “VC_A”, which has the value 30, so you should set this value to 30\.

The key “R” would correspond to “VC_R”, F6 to “VC_F6”, etc\.



*Type:*
signed integer



*Example:*

```nix
19
```



### programs\.ninjabrain-bot\.settings\.hotkey_redo\.location



The location of the key\.

If you want to refer to ‘0’ on your numpad, you would set this value to NUMPAD\. Most of the time, STANDARD is what you want\.



*Type:*
one of “STANDARD”, “RIGHT”, “NUMPAD”, “LEFT”, “UNKNOWN”



*Default:*

```nix
"STANDARD"
```



### programs\.ninjabrain-bot\.settings\.hotkey_redo\.modifiers



List of modifier keys\.



*Type:*
list of (one of “ALT_L”, “ALT_R”, “CTRL_L”, “CTRL_R”, “META_L”, “META_R”, “SHIFT_L”, “SHIFT_R”)



*Default:*

```nix
[ ]
```



*Example:*

```nix
[
  "CTRL_L"
]
```



### programs\.ninjabrain-bot\.settings\.hotkey_reset



Hotkey for reset



*Type:*
null or (submodule)



*Default:*

```nix
null
```



### programs\.ninjabrain-bot\.settings\.hotkey_reset\.key



Integer keycode\.

These can be obtained by finding the key from the list of constants at https://javadoc\.io/doc/com\.1stleg/jnativehook/2\.0\.2/constant-values\.html\.

For example, the key “A” corresponds to the field “VC_A”, which has the value 30, so you should set this value to 30\.

The key “R” would correspond to “VC_R”, F6 to “VC_F6”, etc\.



*Type:*
signed integer



*Example:*

```nix
19
```



### programs\.ninjabrain-bot\.settings\.hotkey_reset\.location



The location of the key\.

If you want to refer to ‘0’ on your numpad, you would set this value to NUMPAD\. Most of the time, STANDARD is what you want\.



*Type:*
one of “STANDARD”, “RIGHT”, “NUMPAD”, “LEFT”, “UNKNOWN”



*Default:*

```nix
"STANDARD"
```



### programs\.ninjabrain-bot\.settings\.hotkey_reset\.modifiers



List of modifier keys\.



*Type:*
list of (one of “ALT_L”, “ALT_R”, “CTRL_L”, “CTRL_R”, “META_L”, “META_R”, “SHIFT_L”, “SHIFT_R”)



*Default:*

```nix
[ ]
```



*Example:*

```nix
[
  "CTRL_L"
]
```



### programs\.ninjabrain-bot\.settings\.hotkey_toggle_aa_mode



Hotkey for toggle_aa_mode



*Type:*
null or (submodule)



*Default:*

```nix
null
```



### programs\.ninjabrain-bot\.settings\.hotkey_toggle_aa_mode\.key



Integer keycode\.

These can be obtained by finding the key from the list of constants at https://javadoc\.io/doc/com\.1stleg/jnativehook/2\.0\.2/constant-values\.html\.

For example, the key “A” corresponds to the field “VC_A”, which has the value 30, so you should set this value to 30\.

The key “R” would correspond to “VC_R”, F6 to “VC_F6”, etc\.



*Type:*
signed integer



*Example:*

```nix
19
```



### programs\.ninjabrain-bot\.settings\.hotkey_toggle_aa_mode\.location



The location of the key\.

If you want to refer to ‘0’ on your numpad, you would set this value to NUMPAD\. Most of the time, STANDARD is what you want\.



*Type:*
one of “STANDARD”, “RIGHT”, “NUMPAD”, “LEFT”, “UNKNOWN”



*Default:*

```nix
"STANDARD"
```



### programs\.ninjabrain-bot\.settings\.hotkey_toggle_aa_mode\.modifiers



List of modifier keys\.



*Type:*
list of (one of “ALT_L”, “ALT_R”, “CTRL_L”, “CTRL_R”, “META_L”, “META_R”, “SHIFT_L”, “SHIFT_R”)



*Default:*

```nix
[ ]
```



*Example:*

```nix
[
  "CTRL_L"
]
```



### programs\.ninjabrain-bot\.settings\.hotkey_undo



Hotkey for undo



*Type:*
null or (submodule)



*Default:*

```nix
null
```



### programs\.ninjabrain-bot\.settings\.hotkey_undo\.key



Integer keycode\.

These can be obtained by finding the key from the list of constants at https://javadoc\.io/doc/com\.1stleg/jnativehook/2\.0\.2/constant-values\.html\.

For example, the key “A” corresponds to the field “VC_A”, which has the value 30, so you should set this value to 30\.

The key “R” would correspond to “VC_R”, F6 to “VC_F6”, etc\.



*Type:*
signed integer



*Example:*

```nix
19
```



### programs\.ninjabrain-bot\.settings\.hotkey_undo\.location



The location of the key\.

If you want to refer to ‘0’ on your numpad, you would set this value to NUMPAD\. Most of the time, STANDARD is what you want\.



*Type:*
one of “STANDARD”, “RIGHT”, “NUMPAD”, “LEFT”, “UNKNOWN”



*Default:*

```nix
"STANDARD"
```



### programs\.ninjabrain-bot\.settings\.hotkey_undo\.modifiers



List of modifier keys\.



*Type:*
list of (one of “ALT_L”, “ALT_R”, “CTRL_L”, “CTRL_R”, “META_L”, “META_R”, “SHIFT_L”, “SHIFT_R”)



*Default:*

```nix
[ ]
```



*Example:*

```nix
[
  "CTRL_L"
]
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



