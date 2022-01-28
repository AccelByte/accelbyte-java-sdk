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

@Command(name = "updateWxPayConfig", mixinStandardHelpOptions = true)
public class UpdateWxPayConfig implements Runnable {

    private static final Logger log = LogManager.getLogger(UpdateWxPayConfig.class);

    @Option(names = {"--id"}, description = "id")
    String id;

    @Option(names = {"--validate"}, description = "validate")
    Boolean validate;

    @Option(names = {"--body"}, description = "body")
    String body;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new UpdateWxPayConfig()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            PaymentMerchantConfigInfo response =
            new PaymentConfig(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new ConfigRepositoryImpl()
                    ))

            .updateWxPayConfig(
                new net.accelbyte.sdk.api.platform.operations.payment_config.UpdateWxPayConfig(
                    id,
                    validate,
                    new ObjectMapper().readValue(body, WxPayConfigRequest.class)  
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