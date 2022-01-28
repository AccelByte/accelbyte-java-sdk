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

@Command(name = "listCrossNamespaceAccountLink", mixinStandardHelpOptions = true)
public class ListCrossNamespaceAccountLink implements Runnable {

    private static final Logger log = LogManager.getLogger(ListCrossNamespaceAccountLink.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--userId"}, description = "userId")
    String userId;

    @Option(names = {"--platformId"}, description = "platformId")
    String platformId;

    @Option(names = {"--linkingToken"}, description = "linkingToken")
    String linkingToken;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new ListCrossNamespaceAccountLink()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            new Users(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new ConfigRepositoryImpl()
                    ))

            .listCrossNamespaceAccountLink(
                new net.accelbyte.sdk.api.iam.operations.users.ListCrossNamespaceAccountLink(
                    namespace,
                    userId,
                    platformId,
                    linkingToken
                )
            );
            log.info("Operation successful");
        } catch (Exception e) {
            log.error("Exception occur with message : [{}]", e.getMessage());
        }
    }
}