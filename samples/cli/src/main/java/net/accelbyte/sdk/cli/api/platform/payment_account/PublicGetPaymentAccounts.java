package net.accelbyte.sdk.cli.api.platform.payment_account;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.wrappers.PaymentAccount;
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

@Command(name = "publicGetPaymentAccounts", mixinStandardHelpOptions = true)
public class PublicGetPaymentAccounts implements Runnable {

    private static final Logger log = LogManager.getLogger(PublicGetPaymentAccounts.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--userId"}, description = "userId")
    String userId;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new PublicGetPaymentAccounts()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            List<net.accelbyte.sdk.api.platform.models.PaymentAccount> response =
            new PaymentAccount(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new ConfigRepositoryImpl()
                    ))

            .publicGetPaymentAccounts(
                new net.accelbyte.sdk.api.platform.operations.payment_account.PublicGetPaymentAccounts(
                    namespace,
                    userId
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