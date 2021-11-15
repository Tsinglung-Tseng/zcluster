{ ... }:
{
  security.sudo.wheelNeedsPassword = false;
  users.mutableUsers = false;

  services.sssd = {
    enable = true;
    config = ''
      [sssd]
      domains = tek-pi.com
      config_file_version = 2
      services = nss, pam

      [nss]

      [pam]

      [domain/tek-pi.com]
      ad_domain = tek-pi.com
      krb5_realm = TEK-PI.COM
      cache_credentials = True
      ldap_id_mapping = True
      ldap_schema = ad

      id_provider = ad

      krb5_store_password_if_offline = True
#      default_shell = /run/current-system/sw/bin/bash
      use_fully_qualified_names = False
      fallback_homedir = /home/%u

      access_provider = ad
    '';
  };

  deployment.keys."krb5.keytab" = {
    user = "root";
    group = "root";
    permissions = "0600";
    keyFile = ../keys/krb5.keytab;
    destDir = "/etc";
  };

  users.users.root = {
    openssh.authorizedKeys.keys = [
        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCzzzhSvL2Nm0I8hr8bNZzcSXZCx2FfejXyLkF9DEMaoW2SPvx4PPwhhDPacP/rEEqeHIYWYI+2ncCxCGlFrj/nAKPqLyFFlT+wCzCiNfSr0tj9PhsQfekWPSr0ZZzHRpDTjbAkm8UZUF3xPPz5sbaU1QBL+ruOOqVN37NpnHxFYzxyveB5A6diSeR9nE9A/KRHDF25AnFNRk6Pzs2bCBXUvJuSgBmWrO3XzrBfsmClHR9P3EI1k1HYIt2u3NV3ID9rk7+NhF6Sh+2mpcojbRPQbc1pEVTVwa0LHav3JeiaCUGa3petMHWYIEaKvNEc4MuO1ahRBmZPvcESoPd2k6RRJJqxpR2AWz9WWtkM8dmJoDwblXO1KKBc5rpWR/nLvbLgbrAHsVXhBuEpjKeMd4QOM6C1ByyanhsRud/StUrGQ9R2pQwujPo2Vu7xSWxkAxks3Z7D3cUKxNSX7en3/rk+p889l2lY7KBFXT7TiRx9iaA79yIY/gKXz85xOmEPUg8= ttseng@ttsengsmbp.tek-pi.com"
    ];
  };
}
