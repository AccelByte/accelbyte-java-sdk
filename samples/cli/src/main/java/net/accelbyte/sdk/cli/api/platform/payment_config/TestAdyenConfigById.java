package net.accelbyte.sdk.cli.api.platform.payment_config;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.wrappers.PaymentConfig;
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

@Command(name = "testAdyenConfigById", mixinStandardHelpOptions = true)
public class TestAdyenConfigById implements Runnable {

    private static final Logger log = LogManager.getLogger(TestAdyenConfigById.class);

    @Option(names = {"--id"}, description = "id")
    String id;

    @Option(names = {"--sandbox"}, description = "sandbox")
    Boolean sandbox;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new TestAdyenConfigById()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            TestResult response =
            new PaymentConfig(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new ConfigRepositoryImpl()
                    ))

            .testAdyenConfigById(
                new net.accelbyte.sdk.api.platform.operations.payment_config.TestAdyenConfigById(
                    id,
                    sandbox
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