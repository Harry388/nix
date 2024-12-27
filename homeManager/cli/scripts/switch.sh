current_generation=$(nixos-rebuild list-generations | grep current | awk '{print $1}')

sudo nixos-rebuild switch --flake ~/nix

new_generation=$(nixos-rebuild list-generations | grep current | awk '{print $1}')

if [[ $current_generation != "$new_generation" ]]; then
    git stage "*"
    git commit -m "$new_generation $1"
    echo "$new_generation: $1"
else
    echo "$new_generation: No Change"
fi
