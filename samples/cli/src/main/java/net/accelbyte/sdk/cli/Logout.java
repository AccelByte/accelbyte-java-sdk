package net.accelbyte.sdk.cli;

import net.accelbyte.sdk.cli.repository.CLITokenRepositoryImpl;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.client.OkhttpClient;
import net.accelbyte.sdk.core.repository.ConfigRepositoryImpl;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import picocli.CommandLine.Command;

@Command(name = "logout", mixinStandardHelpOptions = true)
public class Logout implements Runnable {

    private static final Logger log = LogManager.getLogger(Logout.class);

    @Override
    public void run() {
        AccelByteSDK sdk = new AccelByteSDK(
                new OkhttpClient(),
                CLITokenRepositoryImpl.getInstance(),
                new ConfigRepositoryImpl()
        );
        boolean logout = sdk.logout();
        if (logout) {
            log.info("logout success");
        } else {
            log.fatal("logout failed");
        }
    }
}