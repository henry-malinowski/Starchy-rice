# Starchy-rice
### i3-wm

i3-gaps-next-git, this also requires `~/.Xresources` at the moment.

* [mpd](https://www.archlinux.org/packages/extra/x86_64/mpd/), [libmpdclient](https://www.archlinux.org/packages/extra/x86_64/libmpdclient/), [mpc](https://www.archlinux.org/packages/extra/x86_64/mpc/) 

* [feh](https://www.archlinux.org/packages/extra/x86_64/feh/) for setting the wallpaper

* [unclutter (AUR)](https://aur.archlinux.org/packages/unclutter-xfixes-git/) for hiding the mouse cursor

* [numlockx](https://wiki.archlinux.org/index.php/Activating_Numlock_on_Bootup#startx) for enabling numlock once X.Org starts.

* [network-manager-applet](https://www.archlinux.org/packages/extra/x86_64/network-manager-applet/)

* thunar (file manager)

  * [gvfs](https://www.archlinux.org/packages/extra/x86_64/gvfs/) (trash support and mounting)

  * thunar-archive-plugin

  * thunar-media-tags-plugin

  * thunar-volman

  * tumbler

    install command `pacman -S thunar thunar-{archive-plugin,media-tags-plugin,volman} tumbler gvfs gvfs-{afc,gphoto2,mtp,nfs}`

* [rofi](https://www.archlinux.org/packages/community/x86_64/rofi/) (program launcher)

* [compton](https://www.archlinux.org/packages/community/x86_64/compton/)

  * Compton is not configured just turned on

* [termite](https://wiki.archlinux.org/index.php/Termite)

* [polybar](https://aur.archlinux.org/packages/polybar-git)

  * mpd hook
  * fonts
    * [ttf-nerd-fonts-symbols (AUR)](https://aur.archlinux.org/packages/ttf-nerd-fonts-symbols/)
    * [ttf-material-icons (AUR)](https://aur.archlinux.org/packages/ttf-material-icons/) install manually
    * [ttf-google-fonts-git (AUR)](https://aur.archlinux.org/packages/ttf-google-fonts-git/) OR [ttf-roboto](https://www.archlinux.org/packages/community/any/ttf-roboto/)

---

### zsh and bash
If a theme is not loaded both bash and zsh have matching PS1 prompts.

* [zsh](https://www.archlinux.org/packages/extra/x86_64/zsh/)
* [antigen (AUR)](https://aur.archlinux.org/packages/antigen-git)
* [Generic Colouriser (AUR)](https://aur.archlinux.org/packages/grc/)

In order to make this installation portable, the initialization script for Antigen will be symlinked into our the antigen folder after installation.

Once installed...

```sh
# from inside the repo
stow zsh
ln -s $ANTIGEN_INIT $HOME/.config/antigen/antigen.zsh
sudo chsh $USER --shell=/bin/zsh
# enter password
# restart shell
```

---

### URxvt
#### URxvt pluggins 
* [rxvt-unicode-better-wheel-scrolling-unicode3](https://aur.archlinux.org/packages/rxvt-unicode-better-wheel-scrolling-unicode3/)
* [urxvt-resize-font-git (AUR)](https://aur.archlinux.org/packages/urxvt-resize-font-git/)
    - Ctrl+Down (increase font size)
    - Ctrl+Up   (decrease font size)
* [urxvt-perls](https://www.archlinux.org/packages/community/any/urxvt-perls/)
* [urxvt-fullscreen (AUR)](https://aur.archlinux.org/packages/urxvt-fullscreen/)
    - F11 toggles fullscreen
    - May be removed later because Mod+F in i3 provides the same functionality

[`~/.Xresources`](https://wiki.archlinux.org/index.php/x_resources) can be symlinked `~/.Xdefaults`

---

### vim/neovim

While vim and neovim can be stow'ed separately it is worth noting that neovim's `after/` and `syntax/` directories are just symlinks to vim's directories.

* [vim-git (AUR)](https://aur.archlinux.org/packages/vim-git/) for access to the system clipboard.
* [vim-runtime-git (AUR)](https://aur.archlinux.org/packages/vim-runtime-git/) for compatability with `vim-git`
* vim plugins are managed by [vim-plug (AUR)](https://aur.archlinux.org/packages/vim-plug/).
  
    * Install plugins by opening `vim ~/.vimrc` or `nvim ~/.config/nvim/init.vim`
    * `:source %`
    * `:PlugInstall`

* i3 config .vim is included with code folding if a line starts with 3 pound `#` signs.
* DOSini code folding .vim for polybar config.

---

### pacman
I don't recommend using stow for managing these because this would result in a symlink to a user folder that may be deleted later. Copy the files instead after reading them.

* [reflector](https://www.archlinux.org/packages/community/any/reflector/) updates the [pacman mirrorlist](
  https://www.archlinux.org/packages/core/any/pacman-mirrorlist/) everytime the mirrorlist is installed.
* cached versions of packages are deleted when a package is uninstalled
* only the last 3 versions of packages are retained
* [symlink sh to dash](https://wiki.archlinux.org/index.php/Dash#Relinking_.2Fbin.2Fsh)

---

### TODO:

* xbps setup config files for VoidLinux
* remove/extract `~/.Xresources` requirement for Polybar.
* apt config files for Debian system
* Migration to [GNU Stow](https://www.gnu.org/software/stow/); Possibly augmented to warn about configuration dependencies.

