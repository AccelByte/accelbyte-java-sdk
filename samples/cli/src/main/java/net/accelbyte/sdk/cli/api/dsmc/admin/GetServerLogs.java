package net.accelbyte.sdk.cli.api.dsmc.admin;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.dsmc.models.*;
import net.accelbyte.sdk.api.dsmc.wrappers.Admin;
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

@Command(name = "getServerLogs", mixinStandardHelpOptions = true)
public class GetServerLogs implements Runnable {

    private static final Logger log = LogManager.getLogger(GetServerLogs.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--podName"}, description = "podName")
    String podName;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new GetServerLogs()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            ModelsServerLogs response =
            new Admin(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .getServerLogs(
                new net.accelbyte.sdk.api.dsmc.operations.admin.GetServerLogs(
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