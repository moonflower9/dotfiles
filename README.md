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
common/
x11/
wayland/
```

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

## Notes

- Setup with the help of [Dreams of Autonomy](https://www.youtube.com/watch?v=y6XCebnB9gs).
- Make sure existing config files are backed up or removed before running stow.
- Additional configs can be added directly to a package dir using the same layout.
- AMAZINGLY helpful blogs from people that are really smart:
    - [echasnovski](https://echasnovski.com/blog/2026-03-13-a-guide-to-vim-pack.html)
    - [Functional](https://justinhj.github.io/2026/04/06/refreshing-your-neovim-config-for-0-12-0.html)
    - [Duy NG](https://tduyng.com/blog/neovim-basic-setup)
