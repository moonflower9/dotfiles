# moon's dotfiles

Personal dotfiles managed using GNU Stow.

This repository is intended to be cloned into a local directory (e.g. ~/dotfiles)
and then symlinked into $HOME using stow. Config files live in the structure they
should appear in your home directory.

## Requirements

### GNU Stow

```
pacman -S stow
```

### Git

```
pacman -S git
```

## Layout

Configs are split into three stow packages so X11 and Wayland can coexist without
conflicting each other:

```
common/    # display-server-agnostic: nvim, mpv, shell, zsh
x11/       # X11-only: .xinitrc, .Xresources, picom (+ dwm/dwmblocks)
wayland/   # Wayland-only: dwc (+ bar/launcher/wallpaper)
```

Install only the packages you want; `common` is always needed.

## Installation

Clone the repository into your home directory (commonly ~/dotfiles):

```
git clone https://github.com/moonflower9/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

Then stow the packages you want:

```
# X11 setup
stow common x11

# Wayland setup
stow common wayland

# both at once (configs share $HOME, so only one session runs at a time)
stow common x11 wayland
```

This will create symlinks from the files in this repository to your $HOME directory.

### Upgrading from the old single-package layout

If you previously ran `stow .` against this repo, unstow it first or the new
package layout will clash with the existing symlinks:

```
cd ~/dotfiles
stow -D .          # remove the old single-package symlinks
stow common x11    # re-stow with the new split packages
```

## Wayland package (dwc)

The `wayland/` package targets [dwc](https://git.sr.ht/~corg/DWC), a dynamic
(= dwm-style) compositor built on [neuswc](https://git.sr.ht/~shrub900/neuswc),
following the [wayland.fyi](https://wayland.fyi) minimalist stack. Like dwm, dwc
is configured by editing `config.h` in its source tree and recompiling, so there
is no runtime config file to stow in the usual sense — keep your `config.h` in
`wayland/.config/dwc/` and copy/symlink it into the dwc build directory.

## Notes

- Setup with the help of [Dreams of Autonomy](https://www.youtube.com/watch?v=y6XCebnB9gs).
- Make sure existing config files are backed up or removed before running stow.
- Additional configs can be added directly to a package dir using the same layout.
- AMAZINGLY helpful blogs from people that are really smart:
    - [echasnovski](https://echasnovski.com/blog/2026-03-13-a-guide-to-vim-pack.html)
    - [Functional](https://justinhj.github.io/2026/04/06/refreshing-your-neovim-config-for-0-12-0.html)
    - [Duy NG](https://tduyng.com/blog/neovim-basic-setup)
