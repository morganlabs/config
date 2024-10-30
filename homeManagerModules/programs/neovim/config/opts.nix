{
  # Disable line wrapping
  wrap = false;

  # Line numbers
  nu = true;
  rnu = true;

  # Tabstop
  tabstop = 4;
  shiftwidth = 4;
  softtabstop = 4;
  expandtab = true;
  smartindent = true;

  # Swapfile
  swapfile = false;
  backup = false;

  # Undo
  undofile = true;
  undodir = ''os.getenv("HOME") .. "/.vim/undodir"'';

  hlsearch = true;
  incsearch = true;

  # Colours
  termguicolors = true;

  # Scrolloff
  scrolloff = 10;

  # Misc.
  signcolumn = "yes";
  updatetime = 50;
  colorcolumn = "80";
}
