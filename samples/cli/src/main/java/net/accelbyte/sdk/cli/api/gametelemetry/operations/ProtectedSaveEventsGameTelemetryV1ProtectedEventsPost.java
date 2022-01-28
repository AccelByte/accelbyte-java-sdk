package net.accelbyte.sdk.cli.api.gametelemetry.operations;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.gametelemetry.models.*;
import net.accelbyte.sdk.api.gametelemetry.wrappers.Operations;
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

@Command(name = "protectedSaveEventsGameTelemetryV1ProtectedEventsPost", mixinStandardHelpOptions = true)
public class ProtectedSaveEventsGameTelemetryV1ProtectedEventsPost implements Runnable {

    private static final Logger log = LogManager.getLogger(ProtectedSaveEventsGameTelemetryV1ProtectedEventsPost.class);

    @Option(names = {"--body"}, description = "body")
    String body;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new ProtectedSaveEventsGameTelemetryV1ProtectedEventsPost()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            new Operations(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new ConfigRepositoryImpl()
                    ))

            .protectedSaveEventsGameTelemetryV1ProtectedEventsPost(
                new net.accelbyte.sdk.api.gametelemetry.operations.operations.ProtectedSaveEventsGameTelemetryV1ProtectedEventsPost(
                    new ObjectMapper().readValue(body, new TypeReference<List<TelemetryBody>>() {})
 
                )
            );
            log.info("Operation successful");
        } catch (Exception e) {
            log.error("Exception occur with message : [{}]", e.getMessage());
        }
    }
}