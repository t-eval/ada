{...}: {
  programs.home-manager.enable = true;
  xdg.enable = true;

  home = {
    sessionPath = ["/opt/homebrew/bin"];
    stateVersion = "24.11";
    sessionVariables = {
      EDITOR = "nvim";
      LANG = "ko_KR.UTF-8";
    };
  };

  imports = [./git.nix ./shell.nix ./nvim.nix ./dev-env ./internet];
}