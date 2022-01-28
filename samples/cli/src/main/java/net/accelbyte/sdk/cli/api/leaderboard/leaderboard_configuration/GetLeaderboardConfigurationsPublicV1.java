package net.accelbyte.sdk.cli.api.leaderboard.leaderboard_configuration;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.leaderboard.models.*;
import net.accelbyte.sdk.api.leaderboard.wrappers.LeaderboardConfiguration;
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

@Command(name = "getLeaderboardConfigurationsPublicV1", mixinStandardHelpOptions = true)
public class GetLeaderboardConfigurationsPublicV1 implements Runnable {

    private static final Logger log = LogManager.getLogger(GetLeaderboardConfigurationsPublicV1.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--isArchived"}, description = "isArchived")
    Boolean isArchived;

    @Option(names = {"--isDeleted"}, description = "isDeleted")
    Boolean isDeleted;

    @Option(names = {"--limit"}, description = "limit")
    Integer limit;

    @Option(names = {"--offset"}, description = "offset")
    Integer offset;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new GetLeaderboardConfigurationsPublicV1()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            ModelsGetAllLeaderboardConfigsPublicResp response =
            new LeaderboardConfiguration(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new ConfigRepositoryImpl()
                    ))

            .getLeaderboardConfigurationsPublicV1(
                new net.accelbyte.sdk.api.leaderboard.operations.leaderboard_configuration.GetLeaderboardConfigurationsPublicV1(
                    namespace,
                    isArchived,
                    isDeleted,
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