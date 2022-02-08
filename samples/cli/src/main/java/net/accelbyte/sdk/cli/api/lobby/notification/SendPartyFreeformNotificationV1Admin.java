package net.accelbyte.sdk.cli.api.lobby.notification;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.lobby.models.*;
import net.accelbyte.sdk.api.lobby.wrappers.Notification;
import net.accelbyte.sdk.cli.repository.CLITokenRepositoryImpl;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.client.OkhttpClient;
import net.accelbyte.sdk.core.repository.DefaultConfigRepository;
import org.apache.commons.io.FileUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import picocli.CommandLine;
import picocli.CommandLine.Command;
import picocli.CommandLine.Option;

import java.io.File;
import java.io.InputStream;
import java.util.*;

@Command(name = "sendPartyFreeformNotificationV1Admin", mixinStandardHelpOptions = true)
public class SendPartyFreeformNotificationV1Admin implements Runnable {

    private static final Logger log = LogManager.getLogger(SendPartyFreeformNotificationV1Admin.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--partyId"}, description = "partyId")
    String partyId;

    @Option(names = {"--body"}, description = "body")
    String body;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new SendPartyFreeformNotificationV1Admin()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            new Notification(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .sendPartyFreeformNotificationV1Admin(
                new net.accelbyte.sdk.api.lobby.operations.notification.SendPartyFreeformNotificationV1Admin(
                    namespace,
                    partyId,
                    new ObjectMapper().readValue(body, ModelFreeFormNotificationRequestV1.class)  
                )
            );
            log.info("Operation successful");
        } catch (Exception e) {
            log.error("Exception occur with message : [{}]", e.getMessage());
        }
    }
}