package net.accelbyte.sdk.cli.api.seasonpass.tier;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.seasonpass.models.*;
import net.accelbyte.sdk.api.seasonpass.wrappers.Tier;
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

@Command(name = "createTier", mixinStandardHelpOptions = true)
public class CreateTier implements Runnable {

    private static final Logger log = LogManager.getLogger(CreateTier.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--seasonId"}, description = "seasonId")
    String seasonId;

    @Option(names = {"--body"}, description = "body")
    String body;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new CreateTier()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            List<net.accelbyte.sdk.api.seasonpass.models.Tier> response =
            new Tier(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .createTier(
                new net.accelbyte.sdk.api.seasonpass.operations.tier.CreateTier(
                    namespace,
                    seasonId,
                    new ObjectMapper().readValue(body, TierCreate.class)  
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