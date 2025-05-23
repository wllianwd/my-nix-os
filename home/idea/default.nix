{
  pkgs,
  lib,
  ...
}:
let
  fetchPluginSrc =
    { url, hash }:
    let
      isJar = lib.hasSuffix ".jar" url;
      fetcher = if isJar then pkgs.fetchurl else pkgs.fetchzip;
    in
    fetcher {
      executable = isJar;
      inherit url hash;
    };

  downloadPlugin =
    {
      name,
      version,
      url,
      hash,
    }:
    let
      isJar = lib.hasSuffix ".jar" url;
      installPhase =
        if isJar then
          ''
            runHook preInstall
            mkdir -p $out && cp $src $out
            runHook postInstall
          ''
        else
          ''
            runHook preInstall
            mkdir -p $out && cp -r . $out
            runHook postInstall
          '';
    in
    pkgs.stdenv.mkDerivation {
      inherit name version;
      src = fetchPluginSrc { inherit url hash; };
      dontUnpack = isJar;
      inherit installPhase;
    };

  detekt = downloadPlugin {
    name = "detekt";
    version = "2.4.2";
    url = "https://downloads.marketplace.jetbrains.com/files/10761/621940/Detekt_IntelliJ_Plugin-2.4.2.zip";
    hash = "sha256-9dGFZkrovtu7vawAOJe0AL8fNQXu/mkyha1RXoorXD8=";
  };
  ktfmt = downloadPlugin {
    name = "ktfmt";
    version = "1.2.0.53";
    url = "https://downloads.marketplace.jetbrains.com/files/14912/626875/ktfmt_idea_plugin-1.2.0.53.zip";
    hash = "sha256-SIixbEcmsF8NgwH0k/ur9CpvBYxMdCvu/6wlHlOwYRc=";
  };
  codeium = downloadPlugin {
    name = "codeium";
    version = "1.40.1";
    url = "https://downloads.marketplace.jetbrains.com/files/20540/690543/codeium-1.40.1.zip";
    hash = "sha256-t55rZdHDjZ2DOS5r5ZiBDKLkpl1D4JP18KGORTX3s78=";
  };
in
{
  home.packages = with pkgs; [
    (jetbrains.plugins.addPlugins jetbrains.idea-community [
      detekt
      ktfmt
      codeium
    ])
  ];

  home.file.".ideavimrc".text = builtins.readFile ./.ideavimrc;
}
