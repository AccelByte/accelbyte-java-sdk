/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.social.slot;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.social.models.*;
import net.accelbyte.sdk.api.social.wrappers.Slot;
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

@Command(name = "publicCreateUserNamespaceSlot", mixinStandardHelpOptions = true)
public class PublicCreateUserNamespaceSlot implements Callable<Integer> {

    private static final Logger log = LogManager.getLogger(PublicCreateUserNamespaceSlot.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

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
        int exitCode = new CommandLine(new PublicCreateUserNamespaceSlot()).execute(args);
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
            Slot wrapper = new Slot(sdk);
            net.accelbyte.sdk.api.social.operations.slot.PublicCreateUserNamespaceSlot operation =
                    net.accelbyte.sdk.api.social.operations.slot.PublicCreateUserNamespaceSlot.builder()
                            .namespace(namespace)
                            .userId(userId)
                            .label(label)
                            .tags(tags)
                            .checksum(checksum != null ? checksum : null)
                            .customAttribute(customAttribute != null ? customAttribute : null)
                            .file(file != null ? file : null)
                            .build();
                    wrapper.publicCreateUserNamespaceSlot(operation);
            log.info("Operation successful");
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