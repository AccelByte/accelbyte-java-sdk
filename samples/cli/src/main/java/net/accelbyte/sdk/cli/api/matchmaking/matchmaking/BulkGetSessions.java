package net.accelbyte.sdk.cli.api.matchmaking.matchmaking;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.matchmaking.models.*;
import net.accelbyte.sdk.api.matchmaking.wrappers.Matchmaking;
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

@Command(name = "bulkGetSessions", mixinStandardHelpOptions = true)
public class BulkGetSessions implements Runnable {

    private static final Logger log = LogManager.getLogger(BulkGetSessions.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--matchIDs"}, description = "matchIDs")
    String matchIDs;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new BulkGetSessions()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            List<ModelsMatchmakingResult> response =
            new Matchmaking(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new ConfigRepositoryImpl()
                    ))

            .bulkGetSessions(
                new net.accelbyte.sdk.api.matchmaking.operations.matchmaking.BulkGetSessions(
                    namespace,
                    matchIDs
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