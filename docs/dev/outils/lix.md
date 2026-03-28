# Lix

## Installation
Créer un fichier **flake.nix**
```nix title="flake.nix"
{
  description = "MacBook-Pro-de-Kevin nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
  let
    configuration = { pkgs, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages = [
        pkgs.bat
        pkgs.btop
        pkgs.wget
        pkgs.curl
        pkgs.jq
        pkgs.zsh
        pkgs.eza
        pkgs.gnumake
        pkgs.git
        pkgs.kubectl
        pkgs.kubernetes-helm
        pkgs.kustomize
        pkgs.ghostty-bin
        pkgs.starship
      ];

      fonts.packages = [
        pkgs.nerd-fonts.jetbrains-mono
      ];

      # Use Lix
      nix.package = pkgs.lixPackageSets.stable.lix;

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Enable alternative shell support in nix-darwin.
      # programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 6;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";

      # Unlocking sudo via fingerprint
      security.pam.services.sudo_local.touchIdAuth = true;
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#simple
    darwinConfigurations."MacBook-Pro-de-Kevin" = nix-darwin.lib.darwinSystem {
      modules = [ configuration ];
    };
  };
}
```

## Bootstrap the config
```bash
sudo nix run nix-darwin --extra-experimental-features nix-command --extra-experimental-features flakes -- switch --flake .
```

## Updating the System
```bash
nix flake update
sudo darwin-rebuild switch --flake .
```

## Alias nix-update
Dans ~/.zprofile
```bash
alias nix-update="nix flake update && sudo darwin-rebuild switch --flake ."
```