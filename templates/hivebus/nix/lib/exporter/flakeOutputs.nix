{
  lib,
  super,
  omnibus,
  eachSystem,
  flops,
  projectDir,
}:
let
  filterConfigs =
    config:
    lib.pipe super.hosts [
      (lib.filterAttrs (_: v: v ? "${config}"))
      (lib.mapAttrs (_: v: v.${config}))
    ];
  inherit (omnibus.lib) mapPopsLayouts;
in
(mapPopsLayouts super.pops)
// {
  nixosConfigurations = filterConfigs "nixosConfiguration";

  darwinConfigurations = filterConfigs "darwinConfiguration";

  local = eachSystem (
    system:
    let
      inputs' = (super.pops.flake.setSystem system).inputs;
      dataAll =
        (super.pops.omnibus.lib.addLoadExtender { load.inputs.inputs = inputs'; })
        .layouts.default.exporter.pops.dataAll;
    in
    {
      data =
        (dataAll.addLoadExtender { load.src = projectDir + "/local/data"; })
        .layouts.default;
    }
  );

  packages = eachSystem (
    system:
    let
      inputs = (super.pops.subflake.setSystem system).inputs;
    in
    (
      (flops.haumea.pops.default.setInit {
        src = ../../packages;
        loader = _: path: inputs.nixpkgs.callPackage path { };
        transformer = [ (_cursor: dir: if dir ? default then dir.default else dir) ];
      })
    ).layouts.default
  );
}
