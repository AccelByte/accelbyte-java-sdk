package net.accelbyte.sdk.cli.api.dsmc.admin;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.dsmc.models.*;
import net.accelbyte.sdk.api.dsmc.wrappers.Admin;
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

@Command(name = "listServer", mixinStandardHelpOptions = true)
public class ListServer implements Runnable {

    private static final Logger log = LogManager.getLogger(ListServer.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--count"}, description = "count")
    Integer count;

    @Option(names = {"--offset"}, description = "offset")
    Integer offset;

    @Option(names = {"--region"}, description = "region")
    String region;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new ListServer()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            ModelsListServerResponse response =
            new Admin(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .listServer(
                new net.accelbyte.sdk.api.dsmc.operations.admin.ListServer(
                    namespace,
                    count,
                    offset,
                    region
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