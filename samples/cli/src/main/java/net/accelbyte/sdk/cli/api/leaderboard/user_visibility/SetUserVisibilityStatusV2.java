package net.accelbyte.sdk.cli.api.leaderboard.user_visibility;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.leaderboard.models.*;
import net.accelbyte.sdk.api.leaderboard.wrappers.UserVisibility;
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

@Command(name = "setUserVisibilityStatusV2", mixinStandardHelpOptions = true)
public class SetUserVisibilityStatusV2 implements Runnable {

    private static final Logger log = LogManager.getLogger(SetUserVisibilityStatusV2.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--userId"}, description = "userId")
    String userId;

    @Option(names = {"--body"}, description = "body")
    String body;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new SetUserVisibilityStatusV2()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            ModelsGetUserVisibilityResponse response =
            new UserVisibility(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .setUserVisibilityStatusV2(
                new net.accelbyte.sdk.api.leaderboard.operations.user_visibility.SetUserVisibilityStatusV2(
                    namespace,
                    userId,
                    new ObjectMapper().readValue(body, ModelsSetUserVisibilityRequest.class)  
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