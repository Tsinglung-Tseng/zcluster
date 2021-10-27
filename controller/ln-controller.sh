rm /etc/nixos/configuration.nix
rm /etc/nixos/hardware-configuration.nix

ln -s $(pwd)/configuration.nix /etc/nixos/configuration.nix
ln -s $(pwd)/hardware-configuration.nix /etc/nixos/hardware-configuration.nix
