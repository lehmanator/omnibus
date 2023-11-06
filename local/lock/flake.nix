{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    srvos.url = "github:numtide/srvos";
    srvos.inputs.nixpkgs.follows = "nixpkgs";

    darwin.url = "github:LnL7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  inputs = {
    devshell.url = "github:numtide/devshell";
    devshell.inputs.nixpkgs.follows = "nixpkgs";

    fenix.url = "github:nix-community/fenix";
    fenix.inputs.nixpkgs.follows = "nixpkgs";

    makesSrc.url = "github:fluidattacks/makes";
    makesSrc.flake = false;

    nur.url = "github:nix-community/NUR";

    topiary.url = "github:tweag/topiary";
  };

  inputs = {
    organist.url = "github:nickel-lang/organist";

    nickel.url = "github:tweag/nickel/1921c316ad81bca8100c3a0c6ae2e3da974cdd51";
    # nickel.follows = "organist/nickel";
    nickel.inputs.topiary.follows = "topiary";

    nil.url = "github:oxalica/nil";
    nil.inputs.nixpkgs.follows = "nixpkgs";

    typst.url = "github:typst/typst";
    typst.inputs.nixpkgs.follows = "nixpkgs";
  };

  inputs = {
    ragenix.url = "github:yaxitech/ragenix";
    ragenix.inputs.nixpkgs.follows = "nixpkgs";
    ragenix.inputs.agenix.follows = "agenix";

    agenix.url = "github:ryantm/agenix";
    # agenix.inputs.nixpkgs.follows = "nixpkgs";

    sops-nix.url = "github:Mic92/sops-nix"; # sops-template
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";

    nixfmt.url = "github:serokell/nixfmt/?ref=refs/pull/118/head";
    # nixfmt.inputs.flake-compat.follows = "nixpkgs";
    nixfmt.inputs.flake-compat.follows = "";
  };

  inputs = {
    climodSrc.url = "github:nixosbrasil/climod";
    climodSrc.flake = false;
  };
  outputs = _: { };
}
