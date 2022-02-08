package net.accelbyte.sdk.cli.api.dslogmanager.all_terminated_servers;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.dslogmanager.models.*;
import net.accelbyte.sdk.api.dslogmanager.wrappers.AllTerminatedServers;
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

@Command(name = "batchDownloadServerLogs", mixinStandardHelpOptions = true)
public class BatchDownloadServerLogs implements Runnable {

    private static final Logger log = LogManager.getLogger(BatchDownloadServerLogs.class);

    @Option(names = {"--body"}, description = "body")
    String body;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new BatchDownloadServerLogs()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            new AllTerminatedServers(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .batchDownloadServerLogs(
                new net.accelbyte.sdk.api.dslogmanager.operations.all_terminated_servers.BatchDownloadServerLogs(
                    new ObjectMapper().readValue(body, ModelsBatchDownloadLogsRequest.class)  
                )
            );
            log.info("Operation successful");
        } catch (Exception e) {
            log.error("Exception occur with message : [{}]", e.getMessage());
        }
    }
}