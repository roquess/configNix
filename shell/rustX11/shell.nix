{pkgs ? import <nixpkgs> {}}:
let
  moz_overlay = import (builtins.fetchTarball https://github.com/mozilla/nixpkgs-mozilla/archive/master.tar.gz);
  nixpkgs = import <nixpkgs> { overlays = [ moz_overlay ]; };
in
  pkgs.mkShell {
    buildInputs = with pkgs; [ 
	    (nixpkgs.rustChannelOf { date="2024-03-06"; channel = "nightly"; }).rust
        cargo
        rustc
        pkg-config
        openssl
        xorg.libX11
	    xorg.libX11.dev
        xorg.libXcursor
        xorg.libXrandr
        xorg.libXi
        libGL
        alsa-lib
        udev
    ];

    shellHook = ''
      export LD_LIBRARY_PATH="${pkgs.xorg.libX11}/lib:${pkgs.xorg.libXcursor}/lib:${pkgs.xorg.libXrandr}/lib:${pkgs.xorg.libXi}/lib:${pkgs.libGL}/lib"
    '';
  }
