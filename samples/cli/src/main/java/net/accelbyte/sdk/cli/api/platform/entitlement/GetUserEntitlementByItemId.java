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

@Command(name = "getUserEntitlementByItemId", mixinStandardHelpOptions = true)
public class GetUserEntitlementByItemId implements Runnable {

    private static final Logger log = LogManager.getLogger(GetUserEntitlementByItemId.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--userId"}, description = "userId")
    String userId;

    @Option(names = {"--activeOnly"}, description = "activeOnly")
    Boolean activeOnly;

    @Option(names = {"--entitlementClazz"}, description = "entitlementClazz")
    String entitlementClazz;

    @Option(names = {"--itemId"}, description = "itemId")
    String itemId;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new GetUserEntitlementByItemId()).execute(args);
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

            .getUserEntitlementByItemId(
                new net.accelbyte.sdk.api.platform.operations.entitlement.GetUserEntitlementByItemId(
                    namespace,
                    userId,
                    activeOnly,
                    entitlementClazz,
                    itemId
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