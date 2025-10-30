{ lib, config, pkgs, ... }: {
  networking.firewall.allowedTCPPorts = [ 443 8080 4464 ];
  networking.firewall.allowedUDPPorts = [ 4464];
  services.caddy = {
    enable = true;
    virtualHosts."prohmakas.rnl.tecnico.ulisboa.pt".extraConfig = "
	handle_path /* {
      @badfiles {
        not {
        path_regexp allowed \.(js|html)$
        }
        }

        respond @badfiles 404
        root * /srv/xss
        try_files {path} /index.html
        file_server

      }
";
  };
}
