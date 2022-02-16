/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.cli.api.lobby.notification;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.lobby.models.*;
import net.accelbyte.sdk.api.lobby.wrappers.Notification;
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

@Command(name = "updateTemplateLocalizationV1Admin", mixinStandardHelpOptions = true)
public class UpdateTemplateLocalizationV1Admin implements Callable<Integer> {

    private static final Logger log = LogManager.getLogger(UpdateTemplateLocalizationV1Admin.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--templateLanguage"}, description = "templateLanguage")
    String templateLanguage;

    @Option(names = {"--templateSlug"}, description = "templateSlug")
    String templateSlug;

    @Option(names = {"--body"}, description = "body")
    String body;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new UpdateTemplateLocalizationV1Admin()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public Integer call() {
        try {
            new Notification(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .updateTemplateLocalizationV1Admin(
                new net.accelbyte.sdk.api.lobby.operations.notification.UpdateTemplateLocalizationV1Admin(
                    namespace,
                    templateLanguage,
                    templateSlug,
                    new ObjectMapper().readValue(body, ModelUpdateTemplateRequest.class)  
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