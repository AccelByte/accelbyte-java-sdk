package net.accelbyte.sdk.cli.api.lobby.notification;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.lobby.models.*;
import net.accelbyte.sdk.api.lobby.wrappers.Notification;
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

@Command(name = "getTemplateSlugLocalizationsTemplateV1Admin", mixinStandardHelpOptions = true)
public class GetTemplateSlugLocalizationsTemplateV1Admin implements Runnable {

    private static final Logger log = LogManager.getLogger(GetTemplateSlugLocalizationsTemplateV1Admin.class);

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
            int exitCode = new CommandLine(new GetTemplateSlugLocalizationsTemplateV1Admin()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            ModelGetAllNotificationTemplateSlugResp response =
            new Notification(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .getTemplateSlugLocalizationsTemplateV1Admin(
                new net.accelbyte.sdk.api.lobby.operations.notification.GetTemplateSlugLocalizationsTemplateV1Admin(
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