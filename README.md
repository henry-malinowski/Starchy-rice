# Starchy-rice
### i3-wm

* i3-gaps
* i3-blocks
* i3lock
* i3-status
* j4-dmenu-desktop

---

### zsh and bash
If a theme is not loaded both bash and zsh have matching PS1 prompts.

* [zsh](https://www.archlinux.org/packages/extra/x86_64/zsh/)
* [zsh-completions](https://www.archlinux.org/packages/community/any/zsh-completions/)
* [zsh-syntax-highlighting (AUR)](https://www.archlinux.org/packages/community/any/zsh-syntax-highlighting/)
* [zsh-dircolors-solarized-git (AUR)](https://aur.archlinux.org/packages/zsh-dircolors-solarized-git/)
* [oh-my-zsh (AUR)](https://aur.archlinux.org/packages/oh-my-zsh-git/)
* [Generic Colouriser (AUR)](https://aur.archlinux.org/packages/grc/)

Once installed...

```sh
# from inside the repo
stow zsh
chsh $USER --shell /bin/zsh
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

### vim

* vim-gnome for access to the system clipboard
* vim plugins are managed by [vim-plug (AUR)](https://aur.archlinux.org/packages/vim-plug/)
* i3 config .vim is included with code folding if a line starts with 3 pound `#` signs.

---

### pacman
* I don't recommend using stow for managing these because this would result in a symlink to a user folder that may be deleted later. Copy the files instead after reading them.

---

### TODO

* Migration to [GNU Stow](https://www.gnu.org/software/stow/) possibly augmented to warn about configuration dependencies.

