package net.accelbyte.sdk.cli;

import net.accelbyte.sdk.cli.repository.CLITokenRepositoryImpl;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.client.OkhttpClient;
import net.accelbyte.sdk.core.repository.ConfigRepositoryImpl;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import picocli.CommandLine.Command;

@Command(name = "loginClient", mixinStandardHelpOptions = true)
public class LoginClient implements Runnable {

    private static final Logger log = LogManager.getLogger(LoginClient.class);

    @Override
    public void run() {
        AccelByteSDK sdk = new AccelByteSDK(
                new OkhttpClient(),
                CLITokenRepositoryImpl.getInstance(),
                new ConfigRepositoryImpl()
        );
        boolean login = sdk.loginClient();
        if (login) {
            log.info("login success");
        } else {
            log.fatal("login failed");
        }
    }
}