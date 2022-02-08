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

@Command(name = "listAllTerminatedServers", mixinStandardHelpOptions = true)
public class ListAllTerminatedServers implements Runnable {

    private static final Logger log = LogManager.getLogger(ListAllTerminatedServers.class);

    @Option(names = {"--deployment"}, description = "deployment")
    String deployment;

    @Option(names = {"--endDate"}, description = "endDate")
    String endDate;

    @Option(names = {"--gameMode"}, description = "gameMode")
    String gameMode;

    @Option(names = {"--limit"}, description = "limit")
    Integer limit;

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--next"}, description = "next")
    String next;

    @Option(names = {"--partyId"}, description = "partyId")
    String partyId;

    @Option(names = {"--podName"}, description = "podName")
    String podName;

    @Option(names = {"--previous"}, description = "previous")
    String previous;

    @Option(names = {"--provider"}, description = "provider")
    String provider;

    @Option(names = {"--region"}, description = "region")
    String region;

    @Option(names = {"--sessionId"}, description = "sessionId")
    String sessionId;

    @Option(names = {"--startDate"}, description = "startDate")
    String startDate;

    @Option(names = {"--userId"}, description = "userId")
    String userId;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new ListAllTerminatedServers()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            ModelsListTerminatedServersResponse response =
            new AllTerminatedServers(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .listAllTerminatedServers(
                new net.accelbyte.sdk.api.dslogmanager.operations.all_terminated_servers.ListAllTerminatedServers(
                    deployment,
                    endDate,
                    gameMode,
                    limit,
                    namespace,
                    next,
                    partyId,
                    podName,
                    previous,
                    provider,
                    region,
                    sessionId,
                    startDate,
                    userId
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