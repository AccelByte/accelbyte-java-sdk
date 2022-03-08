/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.cli.api.social.slot;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.social.models.*;
import net.accelbyte.sdk.api.social.wrappers.Slot;
import net.accelbyte.sdk.cli.repository.CLITokenRepositoryImpl;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.ResponseException;
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

@Command(name = "publicUpdateUserNamespaceSlot", mixinStandardHelpOptions = true)
public class PublicUpdateUserNamespaceSlot implements Callable<Integer> {

    private static final Logger log = LogManager.getLogger(PublicUpdateUserNamespaceSlot.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--slotId"}, description = "slotId")
    String slotId;

    @Option(names = {"--userId"}, description = "userId")
    String userId;

    @Option(names = {"--label"}, description = "label")
    String label;

    @Option(names = {"--tags"}, description = "tags")
    List<String> tags;

    @Option(names = {"--checksum"}, description = "checksum")
    String checksum;

    @Option(names = {"--customAttribute"}, description = "customAttribute")
    String customAttribute;

    @Option(names = {"--file"}, description = "file")
    File file;


    @Option(names = {"--logging"}, description = "logger")
    boolean logging;

    public static void main(String[] args) {
        int exitCode = new CommandLine(new PublicUpdateUserNamespaceSlot()).execute(args);
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
            
            SlotInfo response =
            new Slot(sdk)
            .publicUpdateUserNamespaceSlot(
                new net.accelbyte.sdk.api.social.operations.slot.PublicUpdateUserNamespaceSlot(
                    namespace,
                    slotId,
                    userId,
                    label,
                    tags,
                    checksum != null ? checksum : null
                    ,
                    customAttribute != null ? customAttribute : null
                    ,
                    file != null ? FileUtils.openInputStream(file) : null
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