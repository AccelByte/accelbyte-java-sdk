package net.accelbyte.sdk.cli.api.seasonpass.tier;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.seasonpass.models.*;
import net.accelbyte.sdk.api.seasonpass.wrappers.Tier;
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

@Command(name = "grantUserTier", mixinStandardHelpOptions = true)
public class GrantUserTier implements Runnable {

    private static final Logger log = LogManager.getLogger(GrantUserTier.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--userId"}, description = "userId")
    String userId;

    @Option(names = {"--body"}, description = "body")
    String body;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new GrantUserTier()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            UserSeasonSummary response =
            new Tier(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new ConfigRepositoryImpl()
                    ))

            .grantUserTier(
                new net.accelbyte.sdk.api.seasonpass.operations.tier.GrantUserTier(
                    namespace,
                    userId,
                    new ObjectMapper().readValue(body, UserTierGrant.class)  
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