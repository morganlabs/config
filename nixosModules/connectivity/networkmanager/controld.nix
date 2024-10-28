{
  networking = {
    networkmanager.dns = "none";
    nameservers = [
      "76.76.2.2#ControlD"
      "76.76.10.2#ControlD"
      "2606:1a40::2#ControlD"
      "2606:1a40:1::2#ControlD"
    ];
  };

  services.resolved = {
    enable = true;
    dnssec = "true";
    domains = [ "~." ];
    extraConfig = ''
      DNSOverTLS=opportunistic
      MulticastDNS=resolve
    '';
    llmnr = "true";
  };
}
