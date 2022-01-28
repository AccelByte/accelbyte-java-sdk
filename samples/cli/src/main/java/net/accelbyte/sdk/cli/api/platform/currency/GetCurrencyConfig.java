package net.accelbyte.sdk.cli.api.platform.currency;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.wrappers.Currency;
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

@Command(name = "getCurrencyConfig", mixinStandardHelpOptions = true)
public class GetCurrencyConfig implements Runnable {

    private static final Logger log = LogManager.getLogger(GetCurrencyConfig.class);

    @Option(names = {"--currencyCode"}, description = "currencyCode")
    String currencyCode;

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new GetCurrencyConfig()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            CurrencyConfig response =
            new Currency(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new ConfigRepositoryImpl()
                    ))

            .getCurrencyConfig(
                new net.accelbyte.sdk.api.platform.operations.currency.GetCurrencyConfig(
                    currencyCode,
                    namespace
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