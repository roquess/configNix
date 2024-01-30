# configNix
List of nixos config

To configure Neovim with NixOS, follow these steps:

Import `neovim-config.nix` into `/etc/nixos/configuration.nix` with:

```nix
imports = [
    your_path/configNix/neovim-config.nix
];
