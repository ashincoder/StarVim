<h1 align="center">StarVim</h1> 

<h6 align="center">A IDE wrapper which is beyond the moon 🌚 and above the stars ⭐ :O!</h1>

</div>

<div align="center">
	
[![Super Linter](https://img.shields.io/github/workflow/status/ashincoder/StarVim/Super-Linter/main?style=flat-square&logo=github&label=Build&color=green)]()
<a href="https://github.com/ashincoder/StarVim"
        ><img
            src="https://img.shields.io/github/repo-size/ashincoder/StarVim?style=flat-square&label=Repo"
            alt="GitHub repository size"
    /></a>
      <a href="https://github.com/ashincoder/StarVim/blob/main/LICENSE"
        ><img
            src="https://img.shields.io/github/license/ashincoder/StarVim?style=flat-square&logo=GNU&label=License"
            alt="License"
    />
[![Gitter](https://img.shields.io/gitter/room/ashincoder/StarVim?style=flat-square&logo=gitter&logoColor=white&label=Chat&color=eb34a4)](https://gitter.im/starvim-conf/community?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)
[![Neovim Minimum Version](https://img.shields.io/badge/Neovim-0.5+-blueviolet.svg?style=flat-square&logo=Neovim&logoColor=white)](https://github.com/neovim/neovim)
[![GitHub Issues](https://img.shields.io/github/issues/ashincoder/StarVim.svg?style=flat-square&label=Issues&color=fc0330)](https://github.com/siduck76/StarVim/issues)
[![Last Commit](https://img.shields.io/github/last-commit/ashincoder/StarVim.svg?style=flat-square&label=Last%20Commit&color=58eb34)](https://github.com/siduck76/StarVim/pulse) 
	      
  </div>

# Installation
Dependencies :
	- neovim (+0.5)
	- pip3 
	- nodejs (for lsp)
	- npm (for lsp)
	- yarn (for lsp)
`bash <(curl -s https://raw.githubusercontent.com/ashincoder/StarVim/main/bin/installer)`

## Update Config

To keep the config up to date :

```
git pull
nvim +PackerCompile
```

> ! This will not affect your 'sv-config.lua'. So don't worry.

# Features

- Packer.nvim as package manager
- Nvim-treesitter for syntax highlighting
- LspInstall for installing lsp servers easily.
- Nvim-compe for autocompletion
- Lspkind to show pictograms on autocompletion items
- Using Nvim-lsp for language perfection and intellisense
- Nvim-lspconfig for nvim-lps configuration
- Telescope for file finding, picking, previewing
- File navigation with Nvimtree
- Using plugins that are mouse friendly (Keyboard is better!)
- managing tabs, buffers with Bufferline
- Autosave functionality.
- Icons on nvimtree, telescope, bufferline/statusline and almost everywhere! with nvim-web-devicons
- Minimal status line (lualine)
- Gitsigns (colored bars for git in my config)
- Nvim-autopairs, for autolosing braces and stuffs
- Neoformat for prettifying / formatting code
- Indent-blankline.Nvim for indentlines
- Smooth scrolling with Neoscroll
- Snip support from VSCode through vsnip supporting custom and predefined snips (friendly-snippets)

- And the Killer Feature ! [![Lua](https://img.shields.io/badge/Made%20with%20Lua-blueviolet.svg?style=for-the-badge&logo=lua)]()
	
## Screenshots
	
![DashBoard](https://github.com/ashincoder/StarVim/blob/screenshots/dashboard.png)
Other screenshots are displayed [here](https://github.com/ashincoder/StarVim/tree/screenshots)

## Contributions
- PR's are always welcome. [![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com) 
- While making a PR, to be more descriptive. :)

## Credits

The following repositories helped me in improving StarVim
-  ChristianChiarulli's [LunarVim](https://github.com/ChristianChiarulli/LunarVim) 
-  Siduck's [NvChad](https://github.com/siduck76/NvChad) 

## TODO

This project is still a work in progress. But there won't be any breakage.

- [ ] Documentation, Wiki and stuff
- [ ] More Custom Colorschemes 
- [ ] Logo
- [ ] Readme
- [ ] Clean code

