package net.accelbyte.sdk.cli.api.matchmaking.operations;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.matchmaking.models.*;
import net.accelbyte.sdk.api.matchmaking.wrappers.Operations;
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

@Command(name = "handlerV3Healthz", mixinStandardHelpOptions = true)
public class HandlerV3Healthz implements Runnable {

    private static final Logger log = LogManager.getLogger(HandlerV3Healthz.class);


    public static void main(String[] args) {
            int exitCode = new CommandLine(new HandlerV3Healthz()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            new Operations(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .handlerV3Healthz(
                new net.accelbyte.sdk.api.matchmaking.operations.operations.HandlerV3Healthz(
                )
            );
            log.info("Operation successful");
        } catch (Exception e) {
            log.error("Exception occur with message : [{}]", e.getMessage());
        }
    }
}