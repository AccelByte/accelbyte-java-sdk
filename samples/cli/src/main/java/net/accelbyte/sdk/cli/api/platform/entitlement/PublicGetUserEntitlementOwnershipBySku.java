package net.accelbyte.sdk.cli.api.platform.entitlement;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.wrappers.Entitlement;
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

@Command(name = "publicGetUserEntitlementOwnershipBySku", mixinStandardHelpOptions = true)
public class PublicGetUserEntitlementOwnershipBySku implements Runnable {

    private static final Logger log = LogManager.getLogger(PublicGetUserEntitlementOwnershipBySku.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--userId"}, description = "userId")
    String userId;

    @Option(names = {"--entitlementClazz"}, description = "entitlementClazz")
    String entitlementClazz;

    @Option(names = {"--sku"}, description = "sku")
    String sku;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new PublicGetUserEntitlementOwnershipBySku()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            TimedOwnership response =
            new Entitlement(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .publicGetUserEntitlementOwnershipBySku(
                new net.accelbyte.sdk.api.platform.operations.entitlement.PublicGetUserEntitlementOwnershipBySku(
                    namespace,
                    userId,
                    entitlementClazz,
                    sku
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