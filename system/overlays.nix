{ nur, pkgs, ... }:

{

  nixpkgs = {
    config = {
      permittedInsecurePackages = [
        "electron-19.1.9"
        "python3.12-youtube-dl-2021.12.17"
      ];
    };
    overlays = [
      nur.overlays.default
      (
        self: super:
        # fix zoom screen sharing (https://github.com/NixOS/nixpkgs/issues/107233)
        {
          zoomUsFixed = pkgs.zoom-us.overrideAttrs (old: {
            postFixup =
              old.postFixup
              + ''
                wrapProgram $out/bin/zoom-us --unset XDG_SESSION_TYPE
              '';
          });
          zoom = pkgs.zoom-us.overrideAttrs (old: {
            postFixup =
              old.postFixup
              + ''
                wrapProgram $out/bin/zoom --unset XDG_SESSION_TYPE
              '';
          });
        })
    ];
  };

}
