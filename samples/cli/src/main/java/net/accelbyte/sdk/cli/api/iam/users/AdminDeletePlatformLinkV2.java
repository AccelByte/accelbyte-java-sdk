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

@Command(name = "adminDeletePlatformLinkV2", mixinStandardHelpOptions = true)
public class AdminDeletePlatformLinkV2 implements Runnable {

    private static final Logger log = LogManager.getLogger(AdminDeletePlatformLinkV2.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--platformId"}, description = "platformId")
    String platformId;

    @Option(names = {"--userId"}, description = "userId")
    String userId;

    @Option(names = {"--platformNamespace"}, description = "platformNamespace")
    String platformNamespace;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new AdminDeletePlatformLinkV2()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            new Users(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .adminDeletePlatformLinkV2(
                new net.accelbyte.sdk.api.iam.operations.users.AdminDeletePlatformLinkV2(
                    namespace,
                    platformId,
                    userId,
                    platformNamespace
                )
            );
            log.info("Operation successful");
        } catch (Exception e) {
            log.error("Exception occur with message : [{}]", e.getMessage());
        }
    }
}