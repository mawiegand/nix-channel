let
  # Import sources
  sources = import ./nix/sources.nix;

  hello = pkgs.writeShellScriptBin "hello" ''
    echo "Hello from mawiegand Nix channel overlay!"
  '';

  pkgs = import sources.nixpkgs {
    overlays = [
      (self: super: {
        inherit hello;
      })
    ];
  };
in pkgs
