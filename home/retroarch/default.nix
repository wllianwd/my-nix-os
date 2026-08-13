{ pkgs, ... }:

let
  global = import ../global.nix;
  retroarch = pkgs.retroarch;
in {
  home.packages = with pkgs; [
    retroarch

    libretro.snes9x
    libretro.genesis-plus-gx
    libretro.fbneo
    libretro.mupen64plus
    libretro.gambatte

    (writeShellScriptBin "retroarch-launch" ''
      system="$1"
      rom="$2"

      case "$system" in
        gb)
          core="${libretro.gambatte}/lib/retroarch/cores/gambatte_libretro.so"
          ;;
        gbc)
          core="${libretro.gambatte}/lib/retroarch/cores/gambatte_libretro.so"
          ;;
        snes)
          core="${libretro.snes9x}/lib/retroarch/cores/snes9x_libretro.so"
          ;;
        megadrive)
          core="${libretro.genesis-plus-gx}/lib/retroarch/cores/genesis_plus_gx_libretro.so"
          ;;
        neogeo)
          core="${libretro.fbneo}/lib/retroarch/cores/fbneo_libretro.so"
          ;;
        n64)
          core="${libretro.mupen64plus}/lib/retroarch/cores/mupen64plus_next_libretro.so"
          ;;
        *)
          echo "Unknown system: $system"
          exit 1
          ;;
      esac

      exec ${retroarch}/bin/retroarch \
        -L "$core" \
        "$rom"
    '')
  ];
}
