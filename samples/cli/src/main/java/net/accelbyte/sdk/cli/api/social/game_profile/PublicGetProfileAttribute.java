package net.accelbyte.sdk.cli.api.social.game_profile;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.social.models.*;
import net.accelbyte.sdk.api.social.wrappers.GameProfile;
import net.accelbyte.sdk.cli.repository.CLITokenRepositoryImpl;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.client.OkhttpClient;
import net.accelbyte.sdk.core.repository.DefaultConfigRepository;
import org.apache.commons.io.FileUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import picocli.CommandLine;
import picocli.CommandLine.Command;
import picocli.CommandLine.Option;

import java.io.File;
import java.io.InputStream;
import java.util.*;

@Command(name = "publicGetProfileAttribute", mixinStandardHelpOptions = true)
public class PublicGetProfileAttribute implements Runnable {

    private static final Logger log = LogManager.getLogger(PublicGetProfileAttribute.class);

    @Option(names = {"--attributeName"}, description = "attributeName")
    String attributeName;

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--profileId"}, description = "profileId")
    String profileId;

    @Option(names = {"--userId"}, description = "userId")
    String userId;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new PublicGetProfileAttribute()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            Attribute response =
            new GameProfile(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .publicGetProfileAttribute(
                new net.accelbyte.sdk.api.social.operations.game_profile.PublicGetProfileAttribute(
                    attributeName,
                    namespace,
                    profileId,
                    userId
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