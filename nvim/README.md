![Logo](https://gitlab.com/GitMaster210/screenshots/-/raw/main/magicvim-high-resolution-color-logo-alt.png)

**My custom configuration of Neovim designed to be light and fast!
The Magic comes from the automation! LSP, Treesitter & Code Completion all
work out of the box, and auto install when you open a file type that
doesn't have code completion for it yet!**

**Please report any issues through the following link [**HERE**](https://gitlab.com/GitMaster210/magicvim/-/issues).**

## 📸 **Screenshots**

### 👋 Alpha
![Alpha](https://gitlab.com/GitMaster210/screenshots/-/raw/main/2023-04-01-143110_1920x1080_scrot.png)
### ⌨️  Whichkey
![Whichkey](https://gitlab.com/GitMaster210/screenshots/-/raw/main/2023-04-01-134907_1920x1080_scrot.png)
### 🌲 Nvim-Tree
![Nvim-Tree](https://gitlab.com/GitMaster210/screenshots/-/raw/main/2023-03-31-162057_1920x1080_scrot.png)
### 🔭 Telescope
![Telescope](https://gitlab.com/GitMaster210/screenshots/-/raw/main/2023-03-31-162028_1920x1080_scrot.png)
### 👾 LSP & CMP
![LSP & CMP](https://gitlab.com/GitMaster210/screenshots/-/raw/main/2023-04-02-124531_1920x1080_scrot.png)
### 🤖 Codeium
![Codeium](https://gitlab.com/GitMaster210/screenshots/-/raw/main/2023-04-02-163527_1920x1080_scrot.png)

## ✨ **Features**

* **[Alpha](https://github.com/goolord/alpha-nvim) for a helpful greeter!**
* **[LSP](https://github.com/VonHeikemen/lsp-zero.nvim) & [CMP](https://github.com/hrsh7th/nvim-cmp) for code completion!**
* **[Codeium](https://github.com/jcdickinson/codeium.nvim) for A.I. code completion!**
* **[Telescope](https://github.com/nvim-telescope/telescope.nvim) for fuzzy finder!**
* **[Whichkey](https://github.com/folke/which-key.nvim) for keymap shortcuts!**
* **[Mason](https://github.com/williamboman/mason.nvim) for LSP management!**
* **[Nvim-Tree](https://github.com/nvim-tree/nvim-tree.lua) for file management!**
* **[Packer](https://github.com/wbthomason/packer.nvim) for plugin management!**
* **And [More](https://gitlab.com/GitMaster210/magicvim/-/blob/main/lua/magicvim/plugins.lua)...!**

## 👓 Nerd Fonts

**You need a nerd font in order for the icons to work properly. This must be done manually.**

1. **Go [HERE](https://www.nerdfonts.com/font-downloads) to download a nerd font of your choice.**
2. **Unpack it into `~/.local/share/fonts`**
3. **Then make sure that your terminal emulator of choice is using that nerd font.**

## 🪄 **Automagic Install! (Arch ONLY!)**
```shell
bash <(curl -s https://gitlab.com/GitMaster210/extra-files-for-magicvim/-/raw/main/utils/install.sh)
```
## 🔧 **Manual Install**

**Installing MagicVim manually assumes that you are not using Arch, and that you already have Neovim and the following dependencies already installed.**

🧰 **Dependencies:**

**Git,  Xclip,  Python3,  Pip (pynvim),  Nodejs,  Npm,  Gcc,  Ranger,  Fzf,  Ripgrep,  The Silver Searcher,  Fd,  LazyGit,  Treesitter**


‼️  **BEFORE YOU INSTALL MAKE SURE TO BACKUP ANY EXISTING NEOVIM CONFIG** ‼️
```shell
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
```
**Now you can safely install MagicVim!**
```shell
git clone https://gitlab.com/GitMaster210/magicvim ~/.config/nvim
nvim
```
## ⚙️  Update Plugins & Mason(LSP)

### In MagicVim
**For Plugins**

`SPC P u`

**For Mason(LSP)**

`SPC l u`

## 📥 Sync with this repository

### In Terminal
```shell
cd ~/.config/nvim
git pull
```
## ⚠️  Uninstall

### In Terminal
```shell
rm -r ~/.config/nvim
rm -r ~/.local/share/nvim
mv ~/.config/nvim.bak ~/.config/nvim
mv ~/.local/share/nvim.bak ~/.local/share/nvim
```
