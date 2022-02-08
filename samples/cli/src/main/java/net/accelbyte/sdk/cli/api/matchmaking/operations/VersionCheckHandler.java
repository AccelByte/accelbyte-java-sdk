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

@Command(name = "versionCheckHandler", mixinStandardHelpOptions = true)
public class VersionCheckHandler implements Runnable {

    private static final Logger log = LogManager.getLogger(VersionCheckHandler.class);


    public static void main(String[] args) {
            int exitCode = new CommandLine(new VersionCheckHandler()).execute(args);
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

            .versionCheckHandler(
                new net.accelbyte.sdk.api.matchmaking.operations.operations.VersionCheckHandler(
                )
            );
            log.info("Operation successful");
        } catch (Exception e) {
            log.error("Exception occur with message : [{}]", e.getMessage());
        }
    }
}