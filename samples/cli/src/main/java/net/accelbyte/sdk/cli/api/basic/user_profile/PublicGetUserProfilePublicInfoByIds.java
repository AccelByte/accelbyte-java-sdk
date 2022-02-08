package net.accelbyte.sdk.cli.api.basic.user_profile;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.basic.models.*;
import net.accelbyte.sdk.api.basic.wrappers.UserProfile;
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

@Command(name = "publicGetUserProfilePublicInfoByIds", mixinStandardHelpOptions = true)
public class PublicGetUserProfilePublicInfoByIds implements Runnable {

    private static final Logger log = LogManager.getLogger(PublicGetUserProfilePublicInfoByIds.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--userIds"}, description = "userIds")
    String userIds;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new PublicGetUserProfilePublicInfoByIds()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            List<UserProfilePublicInfo> response =
            new UserProfile(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .publicGetUserProfilePublicInfoByIds(
                new net.accelbyte.sdk.api.basic.operations.user_profile.PublicGetUserProfilePublicInfoByIds(
                    namespace,
                    userIds
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