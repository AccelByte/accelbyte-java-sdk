package net.accelbyte.sdk.cli.api.eventlog.event_registry;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.eventlog.models.*;
import net.accelbyte.sdk.api.eventlog.wrappers.EventRegistry;
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

@Command(name = "getRegisteredEventsByEventTypeHandler", mixinStandardHelpOptions = true)
public class GetRegisteredEventsByEventTypeHandler implements Runnable {

    private static final Logger log = LogManager.getLogger(GetRegisteredEventsByEventTypeHandler.class);

    @Option(names = {"--eventType"}, description = "eventType")
    String eventType;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new GetRegisteredEventsByEventTypeHandler()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            ModelsEventRegistry response =
            new EventRegistry(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .getRegisteredEventsByEventTypeHandler(
                new net.accelbyte.sdk.api.eventlog.operations.event_registry.GetRegisteredEventsByEventTypeHandler(
                    eventType
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