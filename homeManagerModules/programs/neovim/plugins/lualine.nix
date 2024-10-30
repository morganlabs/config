{
  enable = true;

  settings = {
    options = {
      theme = "horizon";
    };

    sections = {
      lualine_a = [ "mode" ];
      lualine_b = [ "branch" ];
      lualine_c = [
        "filename"
        "diagnostics"
      ];

      lualine_x = [ "searchcount" ];
      lualine_y = [ "filetype" ];
      lualine_z = [ "diff" ];
    };
  };
}
