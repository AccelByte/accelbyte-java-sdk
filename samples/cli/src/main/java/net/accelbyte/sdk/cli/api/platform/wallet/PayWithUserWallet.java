package net.accelbyte.sdk.cli.api.platform.wallet;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.wrappers.Wallet;
import net.accelbyte.sdk.cli.repository.CLITokenRepositoryImpl;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.client.OkhttpClient;
import net.accelbyte.sdk.core.repository.DefaultConfigRepository;
import org.apache.commons.io.FileUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import picocli.CommandLine;
import picocli.CommandLine.Command;
import picocli.CommandLine.Option;

import java.io.File;
import java.io.InputStream;
import java.util.*;

@Command(name = "payWithUserWallet", mixinStandardHelpOptions = true)
public class PayWithUserWallet implements Runnable {

    private static final Logger log = LogManager.getLogger(PayWithUserWallet.class);

    @Option(names = {"--currencyCode"}, description = "currencyCode")
    String currencyCode;

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--userId"}, description = "userId")
    String userId;

    @Option(names = {"--body"}, description = "body")
    String body;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new PayWithUserWallet()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            WalletInfo response =
            new Wallet(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .payWithUserWallet(
                new net.accelbyte.sdk.api.platform.operations.wallet.PayWithUserWallet(
                    currencyCode,
                    namespace,
                    userId,
                    new ObjectMapper().readValue(body, PaymentRequest.class)  
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