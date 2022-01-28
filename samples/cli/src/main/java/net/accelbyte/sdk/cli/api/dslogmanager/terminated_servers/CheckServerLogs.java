package net.accelbyte.sdk.cli.api.dslogmanager.terminated_servers;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.dslogmanager.models.*;
import net.accelbyte.sdk.api.dslogmanager.wrappers.TerminatedServers;
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

@Command(name = "checkServerLogs", mixinStandardHelpOptions = true)
public class CheckServerLogs implements Runnable {

    private static final Logger log = LogManager.getLogger(CheckServerLogs.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--podName"}, description = "podName")
    String podName;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new CheckServerLogs()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            ModelsLogFileStatus response =
            new TerminatedServers(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .checkServerLogs(
                new net.accelbyte.sdk.api.dslogmanager.operations.terminated_servers.CheckServerLogs(
                    namespace,
                    podName
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