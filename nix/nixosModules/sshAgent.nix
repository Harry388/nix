{

    flake.nixosModules.sshAgent = { config, lib, ... }:
    let
        cfg = config.env.sshAgent;
    in
    {

        options.env.sshAgent = {
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
