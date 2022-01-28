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

@Command(name = "deleteTopicByTopicName", mixinStandardHelpOptions = true)
public class DeleteTopicByTopicName implements Runnable {

    private static final Logger log = LogManager.getLogger(DeleteTopicByTopicName.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--topic"}, description = "topic")
    String topic;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new DeleteTopicByTopicName()).execute(args);
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

            .deleteTopicByTopicName(
                new net.accelbyte.sdk.api.lobby.operations.notification.DeleteTopicByTopicName(
                    namespace,
                    topic
                )
            );
            log.info("Operation successful");
        } catch (Exception e) {
            log.error("Exception occur with message : [{}]", e.getMessage());
        }
    }
}