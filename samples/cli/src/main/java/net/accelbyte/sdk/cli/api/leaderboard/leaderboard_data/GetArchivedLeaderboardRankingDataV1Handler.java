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

@Command(name = "getArchivedLeaderboardRankingDataV1Handler", mixinStandardHelpOptions = true)
public class GetArchivedLeaderboardRankingDataV1Handler implements Callable<Integer> {

    private static final Logger log = LogManager.getLogger(GetArchivedLeaderboardRankingDataV1Handler.class);

    @Option(names = {"--leaderboardCode"}, description = "leaderboardCode")
    String leaderboardCode;

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--slug"}, description = "slug")
    String slug;

    @Option(names = {"--leaderboardCodes"}, description = "leaderboardCodes")
    String leaderboardCodes;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new GetArchivedLeaderboardRankingDataV1Handler()).execute(args);
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

            .getArchivedLeaderboardRankingDataV1Handler(
                new net.accelbyte.sdk.api.leaderboard.operations.leaderboard_data.GetArchivedLeaderboardRankingDataV1Handler(
                    leaderboardCode,
                    namespace,
                    slug,
                    leaderboardCodes
                )
            );
            log.info("Operation successful");
            String result = new ObjectMapper().writeValueAsString(response);
            log.info("result: [{}]", result);
            return 0;
        } catch (ResponseException e) {
            log.error("Response occur with message : [{}]", e.getMessage());
            System.err.print(e.getHttpCode());
        } catch (IOException e) {
            log.error("IOException occur with message : [{}]", e.getMessage());
        }
        return 1;
    }
}