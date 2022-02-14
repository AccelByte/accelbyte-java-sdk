package net.accelbyte.sdk.cli.api.platform.payment_config;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.wrappers.PaymentConfig;
import net.accelbyte.sdk.cli.repository.CLITokenRepositoryImpl;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.ResponseException;
import net.accelbyte.sdk.core.client.OkhttpClient;
import net.accelbyte.sdk.core.repository.DefaultConfigRepository;
import org.apache.commons.io.FileUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import picocli.CommandLine;
import picocli.CommandLine.Command;
import picocli.CommandLine.Option;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;
import java.util.concurrent.Callable;

@Command(name = "updateStripeConfig", mixinStandardHelpOptions = true)
public class UpdateStripeConfig implements Callable<Integer> {

    private static final Logger log = LogManager.getLogger(UpdateStripeConfig.class);

    @Option(names = {"--id"}, description = "id")
    String id;

    @Option(names = {"--sandbox"}, description = "sandbox")
    Boolean sandbox;

    @Option(names = {"--validate"}, description = "validate")
    Boolean validate;

    @Option(names = {"--body"}, description = "body")
    String body;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new UpdateStripeConfig()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public Integer call() {
        try {
            PaymentMerchantConfigInfo response =
            new PaymentConfig(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .updateStripeConfig(
                new net.accelbyte.sdk.api.platform.operations.payment_config.UpdateStripeConfig(
                    id,
                    sandbox,
                    validate,
                    new ObjectMapper().readValue(body, StripeConfig.class)  
                )
            );
            String responseString = new ObjectMapper().writerWithDefaultPrettyPrinter().writeValueAsString(response);
            log.info("Operation successful with response below:\n{}", responseString);
            return 0;
        } catch (ResponseException e) {
            log.error("ResponseException occur with message below:\n{}", e.getMessage());
            System.err.print(e.getHttpCode());
        } catch (IOException e) {
            log.error("IOException occur with message below:\n{}", e.getMessage());
        }
        return 1;
    }
}