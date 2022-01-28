package net.accelbyte.sdk.cli.api.leaderboard.leaderboard_data;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.leaderboard.models.*;
import net.accelbyte.sdk.api.leaderboard.wrappers.LeaderboardData;
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

@Command(name = "createArchivedLeaderboardRankingDataV1Handler", mixinStandardHelpOptions = true)
public class CreateArchivedLeaderboardRankingDataV1Handler implements Runnable {

    private static final Logger log = LogManager.getLogger(CreateArchivedLeaderboardRankingDataV1Handler.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--body"}, description = "body")
    String body;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new CreateArchivedLeaderboardRankingDataV1Handler()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            new LeaderboardData(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new ConfigRepositoryImpl()
                    ))

            .createArchivedLeaderboardRankingDataV1Handler(
                new net.accelbyte.sdk.api.leaderboard.operations.leaderboard_data.CreateArchivedLeaderboardRankingDataV1Handler(
                    namespace,
                    new ObjectMapper().readValue(body, ModelsArchiveLeaderboardReq.class)  
                )
            );
            log.info("Operation successful");
        } catch (Exception e) {
            log.error("Exception occur with message : [{}]", e.getMessage());
        }
    }
}