package net.accelbyte.sdk.cli.api.platform.payment_config;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.wrappers.PaymentConfig;
import net.accelbyte.sdk.cli.repository.CLITokenRepositoryImpl;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.client.OkhttpClient;
import net.accelbyte.sdk.core.repository.DefaultConfigRepository;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import picocli.CommandLine;
import picocli.CommandLine.Command;
import picocli.CommandLine.Option;

import java.io.InputStream;
import java.util.*;

@Command(name = "queryPaymentProviderConfig", mixinStandardHelpOptions = true)
public class QueryPaymentProviderConfig implements Runnable {

    private static final Logger log = LogManager.getLogger(QueryPaymentProviderConfig.class);

    @Option(names = {"--limit"}, description = "limit")
    Integer limit;

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--offset"}, description = "offset")
    Integer offset;

    @Option(names = {"--region"}, description = "region")
    String region;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new QueryPaymentProviderConfig()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            PaymentProviderConfigPagingSlicedResult response =
            new PaymentConfig(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .queryPaymentProviderConfig(
                new net.accelbyte.sdk.api.platform.operations.payment_config.QueryPaymentProviderConfig(
                    limit,
                    namespace,
                    offset,
                    region
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