{ config, pkgs, inputs, ... }:
{ 
  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  xdg.desktopEntries."nvim" = {
    name = "NeoVim";
    comment = "Edit text files";
    icon = "nvim";
    # xterm is a symlink and not actually xterm
    exec = "kitty -e ${pkgs.neovim}/bin/nvim %F";
    categories = [ "TerminalEmulator" ];
    terminal = false;
    mimeType = [ "text/plain" ];
  };
  
  programs.neovim = 
  let
    toLua = str: "lua << EOF\n${str}\nEOF\n";
    toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
  in
  {
    enable = true;
    defaultEditor = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraPackages = with pkgs; [
      lua-language-server
      rnix-lsp

      xclip
      wl-clipboard
    ];

    plugins = with pkgs.vimPlugins; [

      {
        plugin = nvim-lspconfig;
        config = toLuaFile ./plugin/lsp.lua;
      }

      {
        plugin = comment-nvim;
        config = toLua "require(\"Comment\").setup()";
      }

      {
        plugin = rose-pine;
        config = "colorscheme rose-pine-moon";
      }

      neodev-nvim

      nvim-cmp 
      {
        plugin = nvim-cmp;
        config = toLuaFile ./plugin/cmp.lua;
      }

      {
        plugin = telescope-nvim;
        config = toLuaFile ./plugin/telescope.lua;
      }

      telescope-fzf-native-nvim 

      cmp_luasnip
      cmp-nvim-lsp
      cmp-treesitter
      cmp-path

      luasnip
      friendly-snippets


      lualine-nvim
      nvim-web-devicons

      {
        plugin = (nvim-treesitter.withPlugins (p: [
          p.tree-sitter-bash
          p.tree-sitter-c
          p.tree-sitter-cpp
          p.tree-sitter-c-sharp
          p.tree-sitter-cmake
          p.tree-sitter-css
          p.tree-sitter-dart
          p.tree-sitter-dockerfile
          p.tree-sitter-glsl
          p.tree-sitter-go
          p.tree-sitter-java
          p.tree-sitter-javascript
          p.tree-sitter-json
          p.tree-sitter-kotlin
          p.tree-sitter-lua
          p.tree-sitter-nix
          p.tree-sitter-python
          p.tree-sitter-ruby
          p.tree-sitter-rust
          p.tree-sitter-scala
          p.tree-sitter-sql
          p.tree-sitter-comment
          p.tree-sitter-toml
          p.tree-sitter-typescript
          p.tree-sitter-vim
          p.tree-sitter-yaml
        ]));
        config = toLuaFile ./plugin/treesitter.lua;
      }

      vim-nix
      nvim-tree-lua
      nvim-autopairs
      nvim-ts-autotag
      crates-nvim
      vim-be-good
      indent-blankline-nvim
      nvim-cursorline
      which-key-nvim
      gitsigns-nvim
    ];

    extraLuaConfig = ''
      ${builtins.readFile ./options.lua}
      ${builtins.readFile ./plugin/other.lua}
    '';
  };
}
