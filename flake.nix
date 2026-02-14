{
  description = "Resume/CV devshell using RenderCV (Nixpkgs 25.11)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
  };

  outputs = { self, nixpkgs }:
    let
      systems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f system);
    in
    {
      devShells = forAllSystems (system:
        let
          pkgs = import nixpkgs { inherit system; };
        in
        {
          default = pkgs.mkShell {
            packages = [
                #   rendercv requirements
                pkgs.python312
                pkgs.uv
                pkgs.typst
                #git
                pkgs.git
                pkgs.lazygit
                # linters
                pkgs.typos
                pkgs.yamllint
            ];

            shellHook = ''
              echo "Resume devshell (nixpkgs 25.11)"
              echo "Then: rendercv render cv/Mirno_Hoogendonk_CV.yaml --output-folder cv/output"
            '';
          };
        });
    };
}