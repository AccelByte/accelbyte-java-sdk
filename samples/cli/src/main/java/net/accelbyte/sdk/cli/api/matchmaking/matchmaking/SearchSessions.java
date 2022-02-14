package net.accelbyte.sdk.cli.api.matchmaking.matchmaking;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.matchmaking.models.*;
import net.accelbyte.sdk.api.matchmaking.wrappers.Matchmaking;
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

@Command(name = "searchSessions", mixinStandardHelpOptions = true)
public class SearchSessions implements Callable<Integer> {

    private static final Logger log = LogManager.getLogger(SearchSessions.class);

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
            int exitCode = new CommandLine(new SearchSessions()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public Integer call() {
        try {
            ServiceGetSessionHistorySearchResponse response =
            new Matchmaking(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .searchSessions(
                new net.accelbyte.sdk.api.matchmaking.operations.matchmaking.SearchSessions(
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