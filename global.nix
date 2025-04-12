let
  # Just a description for your Mac
  host = "nixos";

  # The username, should match with the /home/<user>
  username = "willian";

  # The user home directory
  homeDirectory = "/home/${username}";

  # The place you are going to store this repo with your nix-config
  nixConfigDirectory = "${homeDirectory}/.my-nix-os";

  # The place you have your git repositories, will be used for some aliases like `oidea`
  repositoriesDirectory = "${homeDirectory}/Documents/projects";

  # The git info
  gitEmail = "willian.wd@gmail.com";
  gitUserName = "Williann Dallastella";

  # Temp dir used by nixos
  nixosUserTempDir = builtins.getEnv "TMPDIR";

in
{
  # Expose variables
  host = host;
  username = username;
  homeDirectory = homeDirectory;
  nixConfigDirectory = nixConfigDirectory;
  repositoriesDirectory = repositoriesDirectory;
  gitEmail = gitEmail;
  gitUserName = gitUserName;
  nixosUserTempDir = nixosUserTempDir;
}
