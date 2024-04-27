{ lib, config, pkgs, ... }: {
  networking.firewall.allowedTCPPorts = [ 80 443 ];
  services.caddy = {
    enable = false;
    virtualHosts."prohmakas.rnl.tecnico.ulisboa.pt".extraConfig = "\n";
  };
}
