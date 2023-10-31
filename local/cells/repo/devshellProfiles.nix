let
  inptus' = (inputs.omnibus.pops.flake.setSystem inputs.nixpkgs.system).inputs;
in
(inputs.omnibus.pops.devshellProfiles.addLoadExtender {
  load.inputs = {
    inputs = inptus';
  };
}).layouts.default