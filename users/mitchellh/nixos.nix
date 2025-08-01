{ pkgs, inputs, ... }:

{
  # https://github.com/nix-community/home-manager/pull/2408
  environment.pathsToLink = [ "/share/fish" ];

  # Add ~/.local/bin to PATH
  environment.localBinInPath = true;

  # Since we're using fish as our shell
  programs.fish.enable = true;

  users.users.mitchellh = {
    isNormalUser = true;
    home = "/home/mitchellh";
    extraGroups = [ "docker" "lxd" "wheel" ];
    shell = pkgs.fish;
    hashedPassword = "$y$j9T$ExpT5o.U7iE1hE60Fv6O11$3d/dzduuQO9C9WHG8mUe1KXcOR0Hgiw6XCqa2NYGhjB";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGbTIKIPtrymhvtTvqbU07/e7gyFJqNS4S0xlfrZLOaY mitchellh"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPr9edkp5Fek3pbwnPJ7Z0D6ie0pGVbHF5lra4urt7QL nicolas"
    ];
  };
}
