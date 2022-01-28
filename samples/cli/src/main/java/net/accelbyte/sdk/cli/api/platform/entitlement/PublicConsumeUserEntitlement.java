package net.accelbyte.sdk.cli.api.platform.entitlement;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.wrappers.Entitlement;
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

@Command(name = "publicConsumeUserEntitlement", mixinStandardHelpOptions = true)
public class PublicConsumeUserEntitlement implements Runnable {

    private static final Logger log = LogManager.getLogger(PublicConsumeUserEntitlement.class);

    @Option(names = {"--entitlementId"}, description = "entitlementId")
    String entitlementId;

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--userId"}, description = "userId")
    String userId;

    @Option(names = {"--body"}, description = "body")
    String body;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new PublicConsumeUserEntitlement()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            EntitlementInfo response =
            new Entitlement(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new ConfigRepositoryImpl()
                    ))

            .publicConsumeUserEntitlement(
                new net.accelbyte.sdk.api.platform.operations.entitlement.PublicConsumeUserEntitlement(
                    entitlementId,
                    namespace,
                    userId,
                    new ObjectMapper().readValue(body, EntitlementDecrement.class)  
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