{
  description = "Shared Nix utilities for https://github.com/ratorx";
  outputs = { self }: {
    templates.default = {
      path = ./default;
      description = "Nix flake with regularly used utilties";
    };
  };
}
