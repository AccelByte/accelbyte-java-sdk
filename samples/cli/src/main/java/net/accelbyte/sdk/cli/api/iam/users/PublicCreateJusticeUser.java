package net.accelbyte.sdk.cli.api.iam.users;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.wrappers.Users;
import net.accelbyte.sdk.cli.repository.CLITokenRepositoryImpl;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.client.OkhttpClient;
import net.accelbyte.sdk.core.repository.ConfigRepositoryImpl;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import picocli.CommandLine;
import picocli.CommandLine.Command;
import picocli.CommandLine.Option;

import java.io.InputStream;
import java.util.*;

@Command(name = "publicCreateJusticeUser", mixinStandardHelpOptions = true)
public class PublicCreateJusticeUser implements Runnable {

    private static final Logger log = LogManager.getLogger(PublicCreateJusticeUser.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--targetNamespace"}, description = "targetNamespace")
    String targetNamespace;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new PublicCreateJusticeUser()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            ModelCreateJusticeUserResponse response =
            new Users(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new ConfigRepositoryImpl()
                    ))

            .publicCreateJusticeUser(
                new net.accelbyte.sdk.api.iam.operations.users.PublicCreateJusticeUser(
                    namespace,
                    targetNamespace
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