{ inputs, eachSystem }:
let
  inherit ((inputs.omnibus.pops.load { }).load.inputs) haumea;
in
(inputs.omnibus.pops.load {
  src = ./.;
  loader = with haumea; [ (matchers.nix loaders.scoped) ];
  inputs = {
    inherit inputs eachSystem;
    projectDir = ../..;
  };
})