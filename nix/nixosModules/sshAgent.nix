{

    flake.nixosModules.sshAgent = { config, lib, ... }:
    let
        cfg = config.sshAgent;
    in
    {

        options.sshAgent = {
            addKeysToAgent = lib.mkOption {
                type = lib.types.str;
                default = "no";
            };
        };

        config = {
            programs.ssh = {
                startAgent = true;
                extraConfig = ''
                    Host *
                        AddKeysToAgent ${cfg.addKeysToAgent}
                '';
            };
        };

    };

}
