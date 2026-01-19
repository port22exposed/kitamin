{ lib, pkgs, stdenv }:
stdenv.mkDerivation {
  name = "kitamin";
  version = "0.1.0";

  src = lib.cleanSource ./.;

  nativeBuildInputs = with pkgs; [
    rojo
    stylua
    selene
  ];
}
