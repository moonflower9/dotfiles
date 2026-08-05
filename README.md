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
x11/       # X11-only: .xinitrc, .Xresources, picom
wayland/   # Wayland-only: sway (+ bar/launcher/wallpaper)
```

Install only the packages you want; `common` is always needed.

### Neovim dependencies

The nvim config (in `common`) enables LSP servers and formatters that must be
installed separately for full functionality:

- LSP servers: `lua-language-server`, `rust-analyzer`, `clangd`
- Formatters: `stylua`, `rustfmt`, `clang-format`, `shfmt`

Plugins are managed with `vim.pack` and pinned via
`common/.config/nvim/nvim-pack-lock.json`; they install automatically on first
launch. LSP configs live in `common/.config/nvim/lsp/` and are auto-discovered
by `vim.lsp.enable()`.

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

## X11 package (dwm)

The `x11/` package targets [dwm](https://dwm.suckless.org). `.xinitrc` starts
picom, seeds pywal colors with `wal -i "$WALLPAPER" -q`, sets the wallpaper with
feh, then runs `dwmblocks` and `dwm` in restart loops. The terminal is
[st](https://st.suckless.org); like dwm and dwmblocks it is not bundled here —
build and install it yourself (from your own forks or upstream) before running
`startx`. `$WALLPAPER` comes from `~/.xprofile`, which isn't stowed; create it
yourself, e.g. `export WALLPAPER=/path/to/image.png`.

Runtime deps: `picom`, `feh`, `pywal`, `xorg-xrdb`, `xorg-xsetroot`, plus
dwm/dwmblocks/st built and installed separately.

## Wayland package (sway)

The `wayland/` package targets [sway](https://swaywm.org), the i3-compatible
Wayland compositor. The config lives at `wayland/.config/sway/config` and is
themed with pywal: the sway bar, window borders and foot terminal colors are
all derived from a single image via pywal templates
(`wayland/.config/wal/templates/colors-foot.ini`, plus pywal's built-in
`colors-sway`). The wallpaper path lives in `~/.config/sway/local` (a single
`set $wallpaper /path/to/image.png` line), which isn't stowed so the repo
stays portable — create it yourself before first login. On first login — or
after changing the wallpaper — run `wal -i <path/to/image>` once to seed
`~/.cache/wal/` so the generated color files exist before sway and foot read
them.

Runtime deps: `sway`, `foot`, `wmenu`, `grim`, `slurp`, `wl-clipboard`,
`playerctl`, `pipewire-pulse` (pactl), `lm_sensors` (sensors), `pywal`.

## Notes

- Setup with the help of [Dreams of Autonomy](https://www.youtube.com/watch?v=y6XCebnB9gs).
- Make sure existing config files are backed up or removed before running stow.
- Additional configs can be added directly to a package dir using the same layout.
- AMAZINGLY helpful blogs from people that are really smart:
    - [echasnovski](https://echasnovski.com/blog/2026-03-13-a-guide-to-vim-pack.html)
    - [Functional](https://justinhj.github.io/2026/04/06/refreshing-your-neovim-config-for-0-12-0.html)
    - [Duy NG](https://tduyng.com/blog/neovim-basic-setup)
