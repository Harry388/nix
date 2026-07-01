{

    security.pam.loginLimits = [
        { domain = "*"; item = "memlock"; type = "soft"; value = "unlimited"; }
        { domain = "*"; item = "memlock"; type = "hard"; value = "unlimited"; }
    ];

}
