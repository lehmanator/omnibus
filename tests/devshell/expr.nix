{
  POS,
  POP,
  flops,
  lib,
}:
let
  inputs =
    ((POS.loadInputs.addInputsExtender (
      POP.lib.extendPop flops.lib.flake.pops.inputsExtender (
        self: super: {
          inputs = {
            nixpkgs = POS.loadInputs.outputs.nixpkgs.legacyPackages;
            devshell = POS.loadInputs.outputs.devshell.legacyPackages;
          };
        }
      )
    )).setSystem
      "x86_64-linux"
    ).outputs;

  devshellProfiles =
    (POS.evalModules.devshell.loadProfiles.addLoadExtender {
      inputs = {
        inherit (inputs) fenix nixpkgs;
      };
    }).exports.default;

  shell = inputs.devshell.mkShell {
    name = "devshell";
    imports = [ devshellProfiles.rust ];
  };
in
lib.mapAttrs (_: builtins.unsafeDiscardStringContext) { rust = shell; }