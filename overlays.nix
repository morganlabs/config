inputs:
with inputs;
[
  nur.overlay

  (final: prev: {
    vimPlugins = prev.vimPlugins // {
      nvim-scroll-eof = prev.vimUtils.buildVimPlugin {
        name = "nvim-scroll-eof";
        src = nvim-plugin-scroll-eof;
      };

      nvim-gen = prev.vimUtils.buildVimPlugin {
        name = "nvim-gen";
        src = nvim-plugin-gen;
      };
    };
  })
]
