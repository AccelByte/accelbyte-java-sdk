package net.accelbyte.sdk.cli.api.social.game_profile;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.social.models.*;
import net.accelbyte.sdk.api.social.wrappers.GameProfile;
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

@Command(name = "publicDeleteProfile", mixinStandardHelpOptions = true)
public class PublicDeleteProfile implements Runnable {

    private static final Logger log = LogManager.getLogger(PublicDeleteProfile.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--profileId"}, description = "profileId")
    String profileId;

    @Option(names = {"--userId"}, description = "userId")
    String userId;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new PublicDeleteProfile()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            new GameProfile(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .publicDeleteProfile(
                new net.accelbyte.sdk.api.social.operations.game_profile.PublicDeleteProfile(
                    namespace,
                    profileId,
                    userId
                )
            );
            log.info("Operation successful");
        } catch (Exception e) {
            log.error("Exception occur with message : [{}]", e.getMessage());
        }
    }
}