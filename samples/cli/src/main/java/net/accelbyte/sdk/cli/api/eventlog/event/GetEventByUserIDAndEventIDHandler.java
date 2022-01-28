package net.accelbyte.sdk.cli.api.eventlog.event;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.eventlog.models.*;
import net.accelbyte.sdk.api.eventlog.wrappers.Event;
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

@Command(name = "getEventByUserIDAndEventIDHandler", mixinStandardHelpOptions = true)
public class GetEventByUserIDAndEventIDHandler implements Runnable {

    private static final Logger log = LogManager.getLogger(GetEventByUserIDAndEventIDHandler.class);

    @Option(names = {"--eventId"}, description = "eventId")
    Float eventId;

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--userId"}, description = "userId")
    String userId;

    @Option(names = {"--offset"}, description = "offset")
    Float offset;

    @Option(names = {"--endDate"}, description = "endDate")
    String endDate;

    @Option(names = {"--pageSize"}, description = "pageSize")
    Float pageSize;

    @Option(names = {"--startDate"}, description = "startDate")
    String startDate;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new GetEventByUserIDAndEventIDHandler()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            ModelsEventResponse response =
            new Event(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new ConfigRepositoryImpl()
                    ))

            .getEventByUserIDAndEventIDHandler(
                new net.accelbyte.sdk.api.eventlog.operations.event.GetEventByUserIDAndEventIDHandler(
                    eventId,
                    namespace,
                    userId,
                    offset,
                    endDate,
                    pageSize,
                    startDate
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