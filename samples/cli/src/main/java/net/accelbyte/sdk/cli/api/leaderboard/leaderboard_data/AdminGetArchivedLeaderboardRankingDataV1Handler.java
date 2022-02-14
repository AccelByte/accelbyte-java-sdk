package net.accelbyte.sdk.cli.api.leaderboard.leaderboard_data;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.leaderboard.models.*;
import net.accelbyte.sdk.api.leaderboard.wrappers.LeaderboardData;
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

@Command(name = "adminGetArchivedLeaderboardRankingDataV1Handler", mixinStandardHelpOptions = true)
public class AdminGetArchivedLeaderboardRankingDataV1Handler implements Callable<Integer> {

    private static final Logger log = LogManager.getLogger(AdminGetArchivedLeaderboardRankingDataV1Handler.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--slug"}, description = "slug")
    String slug;

    @Option(names = {"--leaderboardCodes"}, description = "leaderboardCodes")
    String leaderboardCodes;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new AdminGetArchivedLeaderboardRankingDataV1Handler()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public Integer call() {
        try {
            List<ModelsArchiveLeaderboardSignedURLResponse> response =
            new LeaderboardData(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .adminGetArchivedLeaderboardRankingDataV1Handler(
                new net.accelbyte.sdk.api.leaderboard.operations.leaderboard_data.AdminGetArchivedLeaderboardRankingDataV1Handler(
                    namespace,
                    slug,
                    leaderboardCodes
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