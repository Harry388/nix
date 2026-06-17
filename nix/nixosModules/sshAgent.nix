{

    flake.nixosModules.sshAgent = {

        programs.ssh = {
            startAgent = true;
            extraConfig = ''
                Host *
                    AddKeysToAgent yes
            '';
        };

    };

}
