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

@Command(name = "updateNotificationTopicV1Admin", mixinStandardHelpOptions = true)
public class UpdateNotificationTopicV1Admin implements Runnable {

    private static final Logger log = LogManager.getLogger(UpdateNotificationTopicV1Admin.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--topicName"}, description = "topicName")
    String topicName;

    @Option(names = {"--body"}, description = "body")
    String body;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new UpdateNotificationTopicV1Admin()).execute(args);
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

            .updateNotificationTopicV1Admin(
                new net.accelbyte.sdk.api.lobby.operations.notification.UpdateNotificationTopicV1Admin(
                    namespace,
                    topicName,
                    new ObjectMapper().readValue(body, ModelUpdateTopicRequest.class)  
                )
            );
            log.info("Operation successful");
        } catch (Exception e) {
            log.error("Exception occur with message : [{}]", e.getMessage());
        }
    }
}