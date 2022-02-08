package net.accelbyte.sdk.cli.api.iam.users;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.wrappers.Users;
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

@Command(name = "publicGetUserLoginHistoriesV3", mixinStandardHelpOptions = true)
public class PublicGetUserLoginHistoriesV3 implements Runnable {

    private static final Logger log = LogManager.getLogger(PublicGetUserLoginHistoriesV3.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--userId"}, description = "userId")
    String userId;

    @Option(names = {"--after"}, description = "after")
    Float after;

    @Option(names = {"--before"}, description = "before")
    Float before;

    @Option(names = {"--limit"}, description = "limit")
    Float limit;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new PublicGetUserLoginHistoriesV3()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            ModelLoginHistoriesResponse response =
            new Users(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .publicGetUserLoginHistoriesV3(
                new net.accelbyte.sdk.api.iam.operations.users.PublicGetUserLoginHistoriesV3(
                    namespace,
                    userId,
                    after,
                    before,
                    limit
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