package net.accelbyte.sdk.cli.api.platform.wallet;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.wrappers.Wallet;
import net.accelbyte.sdk.cli.repository.CLITokenRepositoryImpl;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.client.OkhttpClient;
import net.accelbyte.sdk.core.repository.ConfigRepositoryImpl;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import picocli.CommandLine;
import picocli.CommandLine.Command;
import picocli.CommandLine.Option;

import java.io.InputStream;
import java.util.*;

@Command(name = "getWallet", mixinStandardHelpOptions = true)
public class GetWallet implements Runnable {

    private static final Logger log = LogManager.getLogger(GetWallet.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--walletId"}, description = "walletId")
    String walletId;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new GetWallet()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            WalletInfo response =
            new Wallet(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new ConfigRepositoryImpl()
                    ))

            .getWallet(
                new net.accelbyte.sdk.api.platform.operations.wallet.GetWallet(
                    namespace,
                    walletId
                )
            );
            log.info("Operation successful");
            String result = new ObjectMapper().writeValueAsString(response);
            log.info("result: [{}]", result);
        } catch (Exception e) {
            log.error("Exception occur with message : [{}]", e.getMessage());
        }
    }
}