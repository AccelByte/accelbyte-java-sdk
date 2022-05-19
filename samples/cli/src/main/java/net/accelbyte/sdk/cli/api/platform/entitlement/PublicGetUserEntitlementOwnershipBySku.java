/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.platform.entitlement;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.wrappers.Entitlement;
import net.accelbyte.sdk.cli.repository.CLITokenRepositoryImpl;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.client.OkhttpClient;
import net.accelbyte.sdk.core.logging.OkhttpLogger;
import net.accelbyte.sdk.core.repository.DefaultConfigRepository;
import org.apache.commons.io.FileUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import picocli.CommandLine;
import picocli.CommandLine.Command;
import picocli.CommandLine.Option;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;
import java.util.concurrent.Callable;

@Command(name = "publicGetUserEntitlementOwnershipBySku", mixinStandardHelpOptions = true)
public class PublicGetUserEntitlementOwnershipBySku implements Callable<Integer> {

    private static final Logger log = LogManager.getLogger(PublicGetUserEntitlementOwnershipBySku.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--userId"}, description = "userId")
    String userId;

    @Option(names = {"--entitlementClazz"}, description = "entitlementClazz")
    String entitlementClazz;

    @Option(names = {"--sku"}, description = "sku")
    String sku;


    @Option(names = {"--logging"}, description = "logger")
    boolean logging;

    public static void main(String[] args) {
        int exitCode = new CommandLine(new PublicGetUserEntitlementOwnershipBySku()).execute(args);
        System.exit(exitCode);
    }

    @Override
    public Integer call() {
        try {
            OkhttpClient httpClient = new OkhttpClient();
            if (logging) {
                httpClient.setLogger(new OkhttpLogger());
            }
            AccelByteSDK sdk = new AccelByteSDK(httpClient, CLITokenRepositoryImpl.getInstance(), new DefaultConfigRepository());
            Entitlement wrapper = new Entitlement(sdk);
            net.accelbyte.sdk.api.platform.operations.entitlement.PublicGetUserEntitlementOwnershipBySku operation =
                    net.accelbyte.sdk.api.platform.operations.entitlement.PublicGetUserEntitlementOwnershipBySku.builder()
                            .namespace(namespace)
                            .userId(userId)
                            .entitlementClazz(entitlementClazz)
                            .sku(sku)
                            .build();
            TimedOwnership response =
                    wrapper.publicGetUserEntitlementOwnershipBySku(operation);
            String responseString = new ObjectMapper().writerWithDefaultPrettyPrinter().writeValueAsString(response);
            log.info("Operation successful with response below:\n{}", responseString);
            return 0;
        } catch (HttpResponseException e) {
            log.error("HttpResponseException occur with message below:\n{}", e.getMessage());
            System.err.print(e.getHttpCode());
        } catch (Exception e) {
            log.error("Exception occur with message below:\n{}", e.getMessage());
        }
        return 1;
    }
}