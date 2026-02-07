# ninjabrain-bot home manager module

Bla bla

## Home Manager Options:

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



### programs\.ninjabrain-bot\.additional_custom_themes

List of custom theme strings\. Ninjabrain bot seperates these by a ` . `



*Type:*
list of attribute set of (submodule)



*Default:*

```nix
[ ]
```



### programs\.ninjabrain-bot\.additional_custom_themes\.\*\.\<name>\.name



This option has no description\.



*Type:*
string matching the pattern ^\[^\.]\*$



### programs\.ninjabrain-bot\.additional_custom_themes\.\*\.\<name>\.value



This option has no description\.



*Type:*
string matching the pattern ^\[^\.]\*$



### programs\.ninjabrain-bot\.settings



This option has no description\.



*Type:*
attribute set of (submodule)



### programs\.ninjabrain-bot\.settings\.\<name>\.enable_http_server



This option has no description\.



*Type:*
boolean



*Default:*

```nix
false
```



### programs\.ninjabrain-bot\.settings\.\<name>\.all_advancements



This option has no description\.



*Type:*
boolean



*Default:*

```nix
false
```



### programs\.ninjabrain-bot\.settings\.\<name>\.alt_clipboard_reader



This option has no description\.



*Type:*
boolean



*Default:*

```nix
false
```



### programs\.ninjabrain-bot\.settings\.\<name>\.always_on_top



This option has no description\.



*Type:*
boolean



*Default:*

```nix
true
```



### programs\.ninjabrain-bot\.settings\.\<name>\.auto_reset



This option has no description\.



*Type:*
boolean



*Default:*

```nix
false
```



### programs\.ninjabrain-bot\.settings\.\<name>\.auto_reset_on_instance_change



This option has no description\.



*Type:*
boolean



*Default:*

```nix
false
```



### programs\.ninjabrain-bot\.settings\.\<name>\.boat_error



This option has no description\.



*Type:*
integer or floating point number between 0 and 0\.7 (both inclusive)



*Default:*

```nix
0.03
```



### programs\.ninjabrain-bot\.settings\.\<name>\.check_for_updates



This option has no description\.



*Type:*
boolean



*Default:*

```nix
true
```



### programs\.ninjabrain-bot\.settings\.\<name>\.color_negative_coords



This option has no description\.



*Type:*
boolean



*Default:*

```nix
false
```



### programs\.ninjabrain-bot\.settings\.\<name>\.combined_offset_information_enabled



This option has no description\.



*Type:*
boolean



*Default:*

```nix
true
```



### programs\.ninjabrain-bot\.settings\.\<name>\.crosshair_correction



This option has no description\.



*Type:*
integer or floating point number between -1 and 1 (both inclusive)



*Default:*

```nix
0
```



### programs\.ninjabrain-bot\.settings\.\<name>\.custom_adjustment



This option has no description\.



*Type:*
integer or floating point number between 0 and 1 (both inclusive)



*Default:*

```nix
0.01
```



### programs\.ninjabrain-bot\.settings\.\<name>\.custom_themes



This option has no description\.



*Type:*
string



*Default:*

```nix
""
```



### programs\.ninjabrain-bot\.settings\.\<name>\.custom_themes_names



This option has no description\.



*Type:*
string



*Default:*

```nix
""
```



### programs\.ninjabrain-bot\.settings\.\<name>\.direction_help_enabled



This option has no description\.



*Type:*
boolean



*Default:*

```nix
false
```



### programs\.ninjabrain-bot\.settings\.\<name>\.mismeasure_warning_enabled



This option has no description\.



*Type:*
boolean



*Default:*

```nix
false
```



### programs\.ninjabrain-bot\.settings\.\<name>\.one_dot_twenty_plus_aa



This option has no description\.



*Type:*
boolean



*Default:*

```nix
false
```



### programs\.ninjabrain-bot\.settings\.\<name>\.overlay_auto_hide



This option has no description\.



*Type:*
boolean



*Default:*

```nix
false
```



### programs\.ninjabrain-bot\.settings\.\<name>\.overlay_hide_delay



This option has no description\.



*Type:*
integer or floating point number between 1 and 3600 (both inclusive)



*Default:*

```nix
30
```



### programs\.ninjabrain-bot\.settings\.\<name>\.overlay_lock_hide



This option has no description\.



*Type:*
boolean



*Default:*

```nix
false
```



### programs\.ninjabrain-bot\.settings\.\<name>\.portal_linking_warning_enabled



This option has no description\.



*Type:*
boolean



*Default:*

```nix
true
```



### programs\.ninjabrain-bot\.settings\.\<name>\.resolution_height



This option has no description\.



*Type:*
integer or floating point number between 1 and 16384 (both inclusive)



*Default:*

```nix
16384
```



### programs\.ninjabrain-bot\.settings\.\<name>\.save_state



This option has no description\.



*Type:*
boolean



*Default:*

```nix
true
```



### programs\.ninjabrain-bot\.settings\.\<name>\.sensitivity



This option has no description\.



*Type:*
integer or floating point number between 0 and 1 (both inclusive)



*Default:*

```nix
0.012727597
```



### programs\.ninjabrain-bot\.settings\.\<name>\.sensitivity_manual



This option has no description\.



*Type:*
integer or floating point number between 0 and 1 (both inclusive)



*Default:*

```nix
0.4341732
```



### programs\.ninjabrain-bot\.settings\.\<name>\.show_angle_errors



This option has no description\.



*Type:*
boolean



*Default:*

```nix
false
```



### programs\.ninjabrain-bot\.settings\.\<name>\.show_angle_updates



This option has no description\.



*Type:*
boolean



*Default:*

```nix
false
```



### programs\.ninjabrain-bot\.settings\.\<name>\.show_nether_coords



This option has no description\.



*Type:*
boolean



*Default:*

```nix
true
```



### programs\.ninjabrain-bot\.settings\.\<name>\.sigma



This option has no description\.



*Type:*
integer or floating point number between 0\.001 and 1 (both inclusive)



*Default:*

```nix
0.1
```



### programs\.ninjabrain-bot\.settings\.\<name>\.sigma_alt



This option has no description\.



*Type:*
integer or floating point number between 0\.001 and 1 (both inclusive)



*Default:*

```nix
0.1
```



### programs\.ninjabrain-bot\.settings\.\<name>\.sigma_boat



This option has no description\.



*Type:*
integer or floating point number between 0\.0001 and 1 (both inclusive)



*Default:*

```nix
0.001
```



### programs\.ninjabrain-bot\.settings\.\<name>\.sigma_manual



This option has no description\.



*Type:*
integer or floating point number between 0\.001 and 1 (both inclusive)



*Default:*

```nix
0.03
```



### programs\.ninjabrain-bot\.settings\.\<name>\.theme



Theme index\.
Positive values refer to the builtin themes that come with ninjabrain bot\.



*Type:*
signed integer



*Default:*

```nix
1
```



### programs\.ninjabrain-bot\.settings\.\<name>\.translucent



This option has no description\.



*Type:*
boolean



*Default:*

```nix
false
```



### programs\.ninjabrain-bot\.settings\.\<name>\.use_adv_statistics



This option has no description\.



*Type:*
boolean



*Default:*

```nix
true
```



### programs\.ninjabrain-bot\.settings\.\<name>\.use_alt_std



This option has no description\.



*Type:*
boolean



*Default:*

```nix
false
```



### programs\.ninjabrain-bot\.settings\.\<name>\.use_obs_overlay



This option has no description\.



*Type:*
boolean



*Default:*

```nix
false
```



### programs\.ninjabrain-bot\.settings\.\<name>\.use_precise_angle



This option has no description\.



*Type:*
boolean



*Default:*

```nix
false
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



