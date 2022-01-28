package net.accelbyte.sdk.cli.api.lobby.notification;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.lobby.models.*;
import net.accelbyte.sdk.api.lobby.wrappers.Notification;
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

@Command(name = "getSlugTemplate", mixinStandardHelpOptions = true)
public class GetSlugTemplate implements Runnable {

    private static final Logger log = LogManager.getLogger(GetSlugTemplate.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--templateSlug"}, description = "templateSlug")
    String templateSlug;

    @Option(names = {"--after"}, description = "after")
    String after;

    @Option(names = {"--before"}, description = "before")
    String before;

    @Option(names = {"--limit"}, description = "limit")
    Integer limit;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new GetSlugTemplate()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            ModelTemplateLocalizationResponse response =
            new Notification(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new ConfigRepositoryImpl()
                    ))

            .getSlugTemplate(
                new net.accelbyte.sdk.api.lobby.operations.notification.GetSlugTemplate(
                    namespace,
                    templateSlug,
                    after,
                    before,
                    limit
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