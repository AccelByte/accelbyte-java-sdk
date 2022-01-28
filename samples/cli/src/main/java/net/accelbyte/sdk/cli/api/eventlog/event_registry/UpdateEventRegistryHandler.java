package net.accelbyte.sdk.cli.api.eventlog.event_registry;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.eventlog.models.*;
import net.accelbyte.sdk.api.eventlog.wrappers.EventRegistry;
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

@Command(name = "updateEventRegistryHandler", mixinStandardHelpOptions = true)
public class UpdateEventRegistryHandler implements Runnable {

    private static final Logger log = LogManager.getLogger(UpdateEventRegistryHandler.class);

    @Option(names = {"--eventId"}, description = "eventId")
    String eventId;

    @Option(names = {"--body"}, description = "body")
    String body;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new UpdateEventRegistryHandler()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            new EventRegistry(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .updateEventRegistryHandler(
                new net.accelbyte.sdk.api.eventlog.operations.event_registry.UpdateEventRegistryHandler(
                    eventId,
                    new ObjectMapper().readValue(body, ModelsEventRegistry.class)  
                )
            );
            log.info("Operation successful");
        } catch (Exception e) {
            log.error("Exception occur with message : [{}]", e.getMessage());
        }
    }
}