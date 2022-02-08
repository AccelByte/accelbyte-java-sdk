package net.accelbyte.sdk.cli.api.platform.entitlement;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.wrappers.Entitlement;
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

@Command(name = "publicGetEntitlementOwnershipToken", mixinStandardHelpOptions = true)
public class PublicGetEntitlementOwnershipToken implements Runnable {

    private static final Logger log = LogManager.getLogger(PublicGetEntitlementOwnershipToken.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--appIds"}, description = "appIds")
    List<String> appIds;

    @Option(names = {"--itemIds"}, description = "itemIds")
    List<String> itemIds;

    @Option(names = {"--skus"}, description = "skus")
    List<String> skus;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new PublicGetEntitlementOwnershipToken()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            OwnershipToken response =
            new Entitlement(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .publicGetEntitlementOwnershipToken(
                new net.accelbyte.sdk.api.platform.operations.entitlement.PublicGetEntitlementOwnershipToken(
                    namespace,
                    appIds,
                    itemIds,
                    skus
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