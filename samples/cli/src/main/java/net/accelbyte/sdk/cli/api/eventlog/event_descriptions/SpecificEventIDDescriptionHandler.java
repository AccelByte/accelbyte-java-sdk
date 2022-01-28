package net.accelbyte.sdk.cli.api.eventlog.event_descriptions;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.eventlog.models.*;
import net.accelbyte.sdk.api.eventlog.wrappers.EventDescriptions;
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

@Command(name = "specificEventIDDescriptionHandler", mixinStandardHelpOptions = true)
public class SpecificEventIDDescriptionHandler implements Runnable {

    private static final Logger log = LogManager.getLogger(SpecificEventIDDescriptionHandler.class);

    @Option(names = {"--eventIds"}, description = "eventIds")
    String eventIds;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new SpecificEventIDDescriptionHandler()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            ModelsMultipleEventID response =
            new EventDescriptions(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new ConfigRepositoryImpl()
                    ))

            .specificEventIDDescriptionHandler(
                new net.accelbyte.sdk.api.eventlog.operations.event_descriptions.SpecificEventIDDescriptionHandler(
                    eventIds
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