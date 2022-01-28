package net.accelbyte.sdk.cli.api.achievement.achievements;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.achievement.models.*;
import net.accelbyte.sdk.api.achievement.wrappers.Achievements;
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

@Command(name = "adminUpdateAchievementListOrder", mixinStandardHelpOptions = true)
public class AdminUpdateAchievementListOrder implements Runnable {

    private static final Logger log = LogManager.getLogger(AdminUpdateAchievementListOrder.class);

    @Option(names = {"--achievementCode"}, description = "achievementCode")
    String achievementCode;

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--body"}, description = "body")
    String body;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new AdminUpdateAchievementListOrder()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            new Achievements(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .adminUpdateAchievementListOrder(
                new net.accelbyte.sdk.api.achievement.operations.achievements.AdminUpdateAchievementListOrder(
                    achievementCode,
                    namespace,
                    new ObjectMapper().readValue(body, ModelsAchievementOrderUpdateRequest.class)  
                )
            );
            log.info("Operation successful");
        } catch (Exception e) {
            log.error("Exception occur with message : [{}]", e.getMessage());
        }
    }
}