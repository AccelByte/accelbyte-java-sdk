package net.accelbyte.sdk.cli.api.eventlog.event_v2;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.eventlog.models.*;
import net.accelbyte.sdk.api.eventlog.wrappers.EventV2;
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

@Command(name = "getEventSpecificUserV2Handler", mixinStandardHelpOptions = true)
public class GetEventSpecificUserV2Handler implements Runnable {

    private static final Logger log = LogManager.getLogger(GetEventSpecificUserV2Handler.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--userId"}, description = "userId")
    String userId;

    @Option(names = {"--endDate"}, description = "endDate")
    String endDate;

    @Option(names = {"--eventName"}, description = "eventName")
    String eventName;

    @Option(names = {"--offset"}, description = "offset")
    Float offset;

    @Option(names = {"--pageSize"}, description = "pageSize")
    Float pageSize;

    @Option(names = {"--startDate"}, description = "startDate")
    String startDate;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new GetEventSpecificUserV2Handler()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            ModelsEventResponseV2 response =
            new EventV2(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .getEventSpecificUserV2Handler(
                new net.accelbyte.sdk.api.eventlog.operations.event_v2.GetEventSpecificUserV2Handler(
                    namespace,
                    userId,
                    endDate,
                    eventName,
                    offset,
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