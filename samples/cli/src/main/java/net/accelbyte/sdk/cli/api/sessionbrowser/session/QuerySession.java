package net.accelbyte.sdk.cli.api.sessionbrowser.session;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.sessionbrowser.models.*;
import net.accelbyte.sdk.api.sessionbrowser.wrappers.Session;
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

@Command(name = "querySession", mixinStandardHelpOptions = true)
public class QuerySession implements Runnable {

    private static final Logger log = LogManager.getLogger(QuerySession.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--gameMode"}, description = "gameMode")
    String gameMode;

    @Option(names = {"--gameVersion"}, description = "gameVersion")
    String gameVersion;

    @Option(names = {"--joinable"}, description = "joinable")
    String joinable;

    @Option(names = {"--limit"}, description = "limit")
    String limit;

    @Option(names = {"--matchExist"}, description = "matchExist")
    String matchExist;

    @Option(names = {"--matchId"}, description = "matchId")
    String matchId;

    @Option(names = {"--offset"}, description = "offset")
    String offset;

    @Option(names = {"--serverStatus"}, description = "serverStatus")
    String serverStatus;

    @Option(names = {"--userId"}, description = "userId")
    String userId;

    @Option(names = {"--sessionType"}, description = "sessionType")
    String sessionType;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new QuerySession()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            ModelsSessionQueryResponse response =
            new Session(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new ConfigRepositoryImpl()
                    ))

            .querySession(
                new net.accelbyte.sdk.api.sessionbrowser.operations.session.QuerySession(
                    namespace,
                    gameMode,
                    gameVersion,
                    joinable,
                    limit,
                    matchExist,
                    matchId,
                    offset,
                    serverStatus,
                    userId,
                    sessionType
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