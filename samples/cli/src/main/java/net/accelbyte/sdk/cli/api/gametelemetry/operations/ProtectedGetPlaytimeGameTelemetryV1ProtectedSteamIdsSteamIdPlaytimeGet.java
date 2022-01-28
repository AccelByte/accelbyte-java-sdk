package net.accelbyte.sdk.cli.api.gametelemetry.operations;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.gametelemetry.models.*;
import net.accelbyte.sdk.api.gametelemetry.wrappers.Operations;
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

@Command(name = "protectedGetPlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimeGet", mixinStandardHelpOptions = true)
public class ProtectedGetPlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimeGet implements Runnable {

    private static final Logger log = LogManager.getLogger(ProtectedGetPlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimeGet.class);

    @Option(names = {"--steamId"}, description = "steamId")
    String steamId;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new ProtectedGetPlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimeGet()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            Integer response =
            new Operations(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .protectedGetPlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimeGet(
                new net.accelbyte.sdk.api.gametelemetry.operations.operations.ProtectedGetPlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimeGet(
                    steamId
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