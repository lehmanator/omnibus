let
  inherit (inputs) dmerge;
in
(omnibus.pops.loadHomeProfiles.addLoadExtender {
  load.inputs = super.inputs.outputs // {
    omnibus = {
      homeModules = super.homeModules.layouts.nixosModules;
    };
    inputs = {
      inherit (omnibus.__inputs__) nur;
    };
  };
}).addExporters
  [
    (POP.extendPop flops.haumea.pops.exporter (
      self: super: {
        exports.customProfiles = self.outputs [ {
          value =
            { selfModule' }:
            with dmerge;
            selfModule' (
              m:
              dmerge m {
                wayland.windowManager.hyprland.__profiles__ = {
                  nvidia.content = true;
                };
              }
            );
          path = [
            "presets"
            "hyprland"
            "default"
          ];
        } ];
      }
    ))
  ]
