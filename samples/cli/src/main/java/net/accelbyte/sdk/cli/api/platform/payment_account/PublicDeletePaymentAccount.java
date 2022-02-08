package net.accelbyte.sdk.cli.api.platform.payment_account;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.wrappers.PaymentAccount;
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

@Command(name = "publicDeletePaymentAccount", mixinStandardHelpOptions = true)
public class PublicDeletePaymentAccount implements Runnable {

    private static final Logger log = LogManager.getLogger(PublicDeletePaymentAccount.class);

    @Option(names = {"--id"}, description = "id")
    String id;

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--type"}, description = "type")
    String type;

    @Option(names = {"--userId"}, description = "userId")
    String userId;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new PublicDeletePaymentAccount()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            new PaymentAccount(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .publicDeletePaymentAccount(
                new net.accelbyte.sdk.api.platform.operations.payment_account.PublicDeletePaymentAccount(
                    id,
                    namespace,
                    type,
                    userId
                )
            );
            log.info("Operation successful");
        } catch (Exception e) {
            log.error("Exception occur with message : [{}]", e.getMessage());
        }
    }
}