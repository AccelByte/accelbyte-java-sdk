package net.accelbyte.sdk.cli.api.seasonpass.season;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.seasonpass.models.*;
import net.accelbyte.sdk.api.seasonpass.wrappers.Season;
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

@Command(name = "checkSeasonPurchasable", mixinStandardHelpOptions = true)
public class CheckSeasonPurchasable implements Runnable {

    private static final Logger log = LogManager.getLogger(CheckSeasonPurchasable.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--userId"}, description = "userId")
    String userId;

    @Option(names = {"--body"}, description = "body")
    String body;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new CheckSeasonPurchasable()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            new Season(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .checkSeasonPurchasable(
                new net.accelbyte.sdk.api.seasonpass.operations.season.CheckSeasonPurchasable(
                    namespace,
                    userId,
                    new ObjectMapper().readValue(body, UserPurchasable.class)  
                )
            );
            log.info("Operation successful");
        } catch (Exception e) {
            log.error("Exception occur with message : [{}]", e.getMessage());
        }
    }
}