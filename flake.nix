{
  description = "Tommaso Bruno's system configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
  };

  outputs = {nixpkgs, ...} @ inputs: let
    macosLib = import ./lib/mkMacOS.nix {inherit inputs;};

    personal-laptop-system = "aarch64-darwin";
  in {
    darwinConfigurations = with macosLib; {
      personal = mkMacOS {
        macModule = ./hosts/personal-mac/kernel.nix;
        homeModule = ./hosts/personal-mac/home.nix;
        nixModule = ./hosts/personal-mac/nix.nix;
        system = personal-laptop-system;
        hostname = "void";
      };
    };

    formatter.${personal-laptop-system} = nixpkgs.legacyPackages.${personal-laptop-system}.alejandra;
  };
}
