/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.cli;

import net.accelbyte.sdk.cli.repository.CLITokenRepositoryImpl;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.client.OkhttpClient;
import net.accelbyte.sdk.core.repository.DefaultConfigRepository;
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
                new DefaultConfigRepository()
        );
        boolean login = sdk.loginClient();
        if (login) {
            log.info("login success");
        } else {
            log.fatal("login failed");
        }
    }
}