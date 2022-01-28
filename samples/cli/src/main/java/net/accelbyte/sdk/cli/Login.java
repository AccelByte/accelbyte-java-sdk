package net.accelbyte.sdk.cli;

import net.accelbyte.sdk.cli.repository.CLITokenRepositoryImpl;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.client.OkhttpClient;
import net.accelbyte.sdk.core.repository.ConfigRepositoryImpl;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import picocli.CommandLine.Command;
import picocli.CommandLine.Option;

@Command(name = "login", mixinStandardHelpOptions = true)
public class Login implements Runnable {
    private static final Logger log = LogManager.getLogger(Login.class);

    @Option(names = {"-u", "--username"}, description = "username")
    String username;

    @Option(names = {"-p", "--password"}, description = "password")
    String password;

    @Override
    public void run() {
        AccelByteSDK sdk = new AccelByteSDK(
                new OkhttpClient(),
                CLITokenRepositoryImpl.getInstance(),
                new ConfigRepositoryImpl()
        );
        boolean login = sdk.loginUser(username, password);
        if (login) {
            log.info("login success");
        } else {
            log.fatal("login failed");
        }
    }
}