{ ... }:
{
  animations.enabled = false;

  general = {
    gaps_in = 5;
    gaps_out = 10;
    border_size = 2;
    resize_on_border = true;
    extend_border_grab_area = true;
    allow_tearing = false;
    layout = "dwindle";
  };

  decoration = {
    rounding = 0;
    drop_shadow = true;
    shadow_range = 0;
    shadow_offset = "4 4";

    blur = {
        enabled = true;
        size =8;
        passes=2;
        noise=0.025;
    };
  };

  misc = {
    force_default_wallpaper = false;
    disable_hyprland_logo = true;
    middle_click_paste = false;
  };
}
