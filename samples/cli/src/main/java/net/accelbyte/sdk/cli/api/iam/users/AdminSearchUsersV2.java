package net.accelbyte.sdk.cli.api.iam.users;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.wrappers.Users;
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

@Command(name = "adminSearchUsersV2", mixinStandardHelpOptions = true)
public class AdminSearchUsersV2 implements Runnable {

    private static final Logger log = LogManager.getLogger(AdminSearchUsersV2.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--after"}, description = "after")
    String after;

    @Option(names = {"--before"}, description = "before")
    String before;

    @Option(names = {"--displayName"}, description = "displayName")
    String displayName;

    @Option(names = {"--limit"}, description = "limit")
    String limit;

    @Option(names = {"--loginId"}, description = "loginId")
    String loginId;

    @Option(names = {"--platformUserId"}, description = "platformUserId")
    String platformUserId;

    @Option(names = {"--roleId"}, description = "roleId")
    String roleId;

    @Option(names = {"--userId"}, description = "userId")
    String userId;

    @Option(names = {"--platformId"}, description = "platformId")
    String platformId;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new AdminSearchUsersV2()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            ModelSearchUsersByPlatformIDResponse response =
            new Users(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .adminSearchUsersV2(
                new net.accelbyte.sdk.api.iam.operations.users.AdminSearchUsersV2(
                    namespace,
                    after,
                    before,
                    displayName,
                    limit,
                    loginId,
                    platformUserId,
                    roleId,
                    userId,
                    platformId
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