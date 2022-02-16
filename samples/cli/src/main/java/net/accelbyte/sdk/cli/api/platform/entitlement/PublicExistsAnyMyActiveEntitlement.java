/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.cli.api.platform.entitlement;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.wrappers.Entitlement;
import net.accelbyte.sdk.cli.repository.CLITokenRepositoryImpl;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.ResponseException;
import net.accelbyte.sdk.core.client.OkhttpClient;
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

@Command(name = "publicExistsAnyMyActiveEntitlement", mixinStandardHelpOptions = true)
public class PublicExistsAnyMyActiveEntitlement implements Callable<Integer> {

    private static final Logger log = LogManager.getLogger(PublicExistsAnyMyActiveEntitlement.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--appIds"}, description = "appIds")
    List<String> appIds;

    @Option(names = {"--itemIds"}, description = "itemIds")
    List<String> itemIds;

    @Option(names = {"--skus"}, description = "skus")
    List<String> skus;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new PublicExistsAnyMyActiveEntitlement()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public Integer call() {
        try {
            Ownership response =
            new Entitlement(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .publicExistsAnyMyActiveEntitlement(
                new net.accelbyte.sdk.api.platform.operations.entitlement.PublicExistsAnyMyActiveEntitlement(
                    namespace,
                    appIds,
                    itemIds,
                    skus
                )
            );
            String responseString = new ObjectMapper().writerWithDefaultPrettyPrinter().writeValueAsString(response);
            log.info("Operation successful with response below:\n{}", responseString);
            return 0;
        } catch (ResponseException e) {
            log.error("ResponseException occur with message below:\n{}", e.getMessage());
            System.err.print(e.getHttpCode());
        } catch (IOException e) {
            log.error("IOException occur with message below:\n{}", e.getMessage());
        }
        return 1;
    }
}