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

@Command(name = "queryUserEntitlements", mixinStandardHelpOptions = true)
public class QueryUserEntitlements implements Runnable {

    private static final Logger log = LogManager.getLogger(QueryUserEntitlements.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--userId"}, description = "userId")
    String userId;

    @Option(names = {"--activeOnly"}, description = "activeOnly")
    Boolean activeOnly;

    @Option(names = {"--appType"}, description = "appType")
    String appType;

    @Option(names = {"--entitlementClazz"}, description = "entitlementClazz")
    String entitlementClazz;

    @Option(names = {"--entitlementName"}, description = "entitlementName")
    String entitlementName;

    @Option(names = {"--itemId"}, description = "itemId")
    List<String> itemId;

    @Option(names = {"--limit"}, description = "limit")
    Integer limit;

    @Option(names = {"--offset"}, description = "offset")
    Integer offset;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new QueryUserEntitlements()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            EntitlementPagingSlicedResult response =
            new Entitlement(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new ConfigRepositoryImpl()
                    ))

            .queryUserEntitlements(
                new net.accelbyte.sdk.api.platform.operations.entitlement.QueryUserEntitlements(
                    namespace,
                    userId,
                    activeOnly,
                    appType,
                    entitlementClazz,
                    entitlementName,
                    itemId,
                    limit,
                    offset
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