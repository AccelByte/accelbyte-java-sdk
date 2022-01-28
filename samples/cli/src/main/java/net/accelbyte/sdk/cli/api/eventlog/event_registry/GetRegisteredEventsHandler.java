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

@Command(name = "getRegisteredEventsHandler", mixinStandardHelpOptions = true)
public class GetRegisteredEventsHandler implements Runnable {

    private static final Logger log = LogManager.getLogger(GetRegisteredEventsHandler.class);


    public static void main(String[] args) {
            int exitCode = new CommandLine(new GetRegisteredEventsHandler()).execute(args);
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

            .getRegisteredEventsHandler(
                new net.accelbyte.sdk.api.eventlog.operations.event_registry.GetRegisteredEventsHandler(
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