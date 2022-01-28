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

@Command(name = "deleteTemplateLocalization", mixinStandardHelpOptions = true)
public class DeleteTemplateLocalization implements Runnable {

    private static final Logger log = LogManager.getLogger(DeleteTemplateLocalization.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--templateLanguage"}, description = "templateLanguage")
    String templateLanguage;

    @Option(names = {"--templateSlug"}, description = "templateSlug")
    String templateSlug;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new DeleteTemplateLocalization()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            new Notification(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new ConfigRepositoryImpl()
                    ))

            .deleteTemplateLocalization(
                new net.accelbyte.sdk.api.lobby.operations.notification.DeleteTemplateLocalization(
                    namespace,
                    templateLanguage,
                    templateSlug
                )
            );
            log.info("Operation successful");
        } catch (Exception e) {
            log.error("Exception occur with message : [{}]", e.getMessage());
        }
    }
}