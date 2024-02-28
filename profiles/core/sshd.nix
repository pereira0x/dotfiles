{ lib, sshKeys, username, ... }: {
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
    };
  };

  users.users.pereira.openssh.authorizedKeys.keys = sshKeys;
}
