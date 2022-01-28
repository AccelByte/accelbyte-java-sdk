package net.accelbyte.sdk.cli.api.leaderboard.leaderboard_configuration;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.leaderboard.models.*;
import net.accelbyte.sdk.api.leaderboard.wrappers.LeaderboardConfiguration;
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

@Command(name = "getLeaderboardConfigurationAdminV1", mixinStandardHelpOptions = true)
public class GetLeaderboardConfigurationAdminV1 implements Runnable {

    private static final Logger log = LogManager.getLogger(GetLeaderboardConfigurationAdminV1.class);

    @Option(names = {"--leaderboardCode"}, description = "leaderboardCode")
    String leaderboardCode;

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new GetLeaderboardConfigurationAdminV1()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            ModelsGetLeaderboardConfigResp response =
            new LeaderboardConfiguration(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .getLeaderboardConfigurationAdminV1(
                new net.accelbyte.sdk.api.leaderboard.operations.leaderboard_configuration.GetLeaderboardConfigurationAdminV1(
                    leaderboardCode,
                    namespace
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