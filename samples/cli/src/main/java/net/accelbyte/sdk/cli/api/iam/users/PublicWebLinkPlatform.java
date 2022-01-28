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

@Command(name = "publicWebLinkPlatform", mixinStandardHelpOptions = true)
public class PublicWebLinkPlatform implements Runnable {

    private static final Logger log = LogManager.getLogger(PublicWebLinkPlatform.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--platformId"}, description = "platformId")
    String platformId;

    @Option(names = {"--clientId"}, description = "clientId")
    String clientId;

    @Option(names = {"--redirectUri"}, description = "redirectUri")
    String redirectUri;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new PublicWebLinkPlatform()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            ModelWebLinkingResponse response =
            new Users(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .publicWebLinkPlatform(
                new net.accelbyte.sdk.api.iam.operations.users.PublicWebLinkPlatform(
                    namespace,
                    platformId,
                    clientId,
                    redirectUri
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