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

@Command(name = "adminCreateJusticeUser", mixinStandardHelpOptions = true)
public class AdminCreateJusticeUser implements Runnable {

    private static final Logger log = LogManager.getLogger(AdminCreateJusticeUser.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--targetNamespace"}, description = "targetNamespace")
    String targetNamespace;

    @Option(names = {"--userId"}, description = "userId")
    String userId;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new AdminCreateJusticeUser()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            ModelCreateJusticeUserResponse response =
            new Users(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .adminCreateJusticeUser(
                new net.accelbyte.sdk.api.iam.operations.users.AdminCreateJusticeUser(
                    namespace,
                    targetNamespace,
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