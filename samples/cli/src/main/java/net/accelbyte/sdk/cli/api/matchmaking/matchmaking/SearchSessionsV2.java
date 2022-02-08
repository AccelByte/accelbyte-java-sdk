package net.accelbyte.sdk.cli.api.matchmaking.matchmaking;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.matchmaking.models.*;
import net.accelbyte.sdk.api.matchmaking.wrappers.Matchmaking;
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

@Command(name = "searchSessionsV2", mixinStandardHelpOptions = true)
public class SearchSessionsV2 implements Runnable {

    private static final Logger log = LogManager.getLogger(SearchSessionsV2.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--channel"}, description = "channel")
    String channel;

    @Option(names = {"--deleted"}, description = "deleted")
    Boolean deleted;

    @Option(names = {"--matchID"}, description = "matchID")
    String matchID;

    @Option(names = {"--partyID"}, description = "partyID")
    String partyID;

    @Option(names = {"--userID"}, description = "userID")
    String userID;

    @Option(names = {"--limit"}, description = "limit")
    Float limit;

    @Option(names = {"--offset"}, description = "offset")
    Float offset;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new SearchSessionsV2()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            ServiceGetSessionHistorySearchResponseV2 response =
            new Matchmaking(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .searchSessionsV2(
                new net.accelbyte.sdk.api.matchmaking.operations.matchmaking.SearchSessionsV2(
                    namespace,
                    channel,
                    deleted,
                    matchID,
                    partyID,
                    userID,
                    limit,
                    offset
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