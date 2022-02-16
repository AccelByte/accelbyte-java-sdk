/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.cli.api.ugc.admin_content;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.ugc.models.*;
import net.accelbyte.sdk.api.ugc.wrappers.AdminContent;
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

@Command(name = "adminDeleteContentScreenshot", mixinStandardHelpOptions = true)
public class AdminDeleteContentScreenshot implements Callable<Integer> {

    private static final Logger log = LogManager.getLogger(AdminDeleteContentScreenshot.class);

    @Option(names = {"--contentId"}, description = "contentId")
    String contentId;

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--screenshotId"}, description = "screenshotId")
    String screenshotId;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new AdminDeleteContentScreenshot()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public Integer call() {
        try {
            new AdminContent(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .adminDeleteContentScreenshot(
                new net.accelbyte.sdk.api.ugc.operations.admin_content.AdminDeleteContentScreenshot(
                    contentId,
                    namespace,
                    screenshotId
                )
            );
            log.info("Operation successful");
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