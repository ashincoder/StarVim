<h1 align="center">StarVim</h1>

<div align="center">

[Install](#installation) • [Why StarVim?](#why-starvim-) • [Screenshots](https://github.com/ashincoder/StarVim/tree/screenshots) • [Contribute](#contributions)

</div>

<h6 align="center">A IDE wrapper which is beyond the moon 🌚 and above the stars ⭐ :O!</h1>

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

![StarVim](https://github.com/ashincoder/StarVim/blob/dev/bin/starvim.png)
	      
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

# Why StarVim ?

The answer everyone is waiting for. 

Here you go :

## Lazy loading
StarVim is lazy loaded so hard that your machine does'nt feel the force of the arrival of StarVim. 
- Almost 25+ plugins are installed. All of them are lazyloaded.

## Colors
StarVim will have more colorschemes with colorfulness. 
- When colorschemes are loaded normally it takes a lot of time. But StarVim has also lazied the colorschemes

## Extensibility
StarVim can be configured within 1 file. Which makes everything simple for the user. 

- While doing a git pull it does'nt affect the user config file. 'sv-config.lua'

+ If you still aren't convinced read the [Features](https://github.com/ashincoder/StarVim#features)

# Features

- Autosave functionality.
- Gitsigns for colors git signs 
- Minimal status line (lualine)
- File navigation with Nvimtree
- Nvim-compe for autocompletion
- Packer.nvim as package manager
- Smooth scrolling with Neoscroll
- Indent-blankline.Nvim for indentlines
- Managing tabs, buffers with Bufferline
- Nvim-treesitter for syntax highlighting
- Nvim-lspconfig for nvim-lps configuration
- LspInstall for installing lsp servers easily.
- Telescope for file finding, picking, previewing
- Nvim-autopairs, for autolosing braces and stuffs
- Formatter.nvim for prettifying / formatting code
- Lspkind to show pictograms on autocompletion items
- Using Nvim-lsp for language perfection and intellisense
- Using plugins that are mouse friendly (Keyboard is better!)
- Icons on nvimtree, telescope, bufferline/statusline and almost everywhere! with nvim-web-devicons
- Snip support from VSCode through vsnip supporting custom and predefined snips (friendly-snippets)

- And the Killer Feature ! [![Lua](https://img.shields.io/badge/Made%20with%20Lua-blueviolet.svg?style=for-the-badge&logo=lua)]()
- Lua makes it faster and smoother. More extensible
	
## Screenshots
	
![DashBoard](https://github.com/ashincoder/StarVim/blob/screenshots/dashboard.png)
Other screenshots are displayed [here](https://github.com/ashincoder/StarVim/tree/screenshots)

## Contributions
- PR's are always welcome , no matter what **So start today** . [![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com) 
- While making a PR, try to be more descriptive. :)

## Error Handling
Check star.log located in `~/.local/share/nvim/star.log` for any errors
More will be added in the wiki

## Questions
If you have any doubts you can freely ask on these following sites:
- [Gitter](https://gitter.im/starvim-conf/community)
- [Reddit](https://www.reddit.com/r/StarVim/)	
- [Discord](https://discord.com/channels/866158163900366879/866158164335394830)
- [Youtube](https://www.youtube.com/channel/UCZqKL3vIdyHUiLuR1vYwVgw)

## Contributions
- PR's are always welcome , no matter what **So start today** . [![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com) 
- While making a PR, try to be more descriptive. :)

## Credits

The following repositories helped me in improving StarVim
-  ChristianChiarulli's [LunarVim](https://github.com/ChristianChiarulli/LunarVim) 
-  Siduck's [NvChad](https://github.com/siduck76/NvChad) 

## TODO

- [ ] Logo
- [X] Readme
- [X] Clean code [![CodeFactor](https://www.codefactor.io/repository/github/ashincoder/starvim/badge)](https://www.codefactor.io/repository/github/ashincoder/starvim)
- [X] More Custom Colorschemes 
- [X] Easily Installable plugins 
- [ ] Documentation, Wiki and stuff
