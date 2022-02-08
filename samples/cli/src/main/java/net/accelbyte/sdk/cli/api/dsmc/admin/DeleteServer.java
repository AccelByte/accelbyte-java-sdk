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

@Command(name = "deleteServer", mixinStandardHelpOptions = true)
public class DeleteServer implements Runnable {

    private static final Logger log = LogManager.getLogger(DeleteServer.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--podName"}, description = "podName")
    String podName;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new DeleteServer()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            new Admin(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .deleteServer(
                new net.accelbyte.sdk.api.dsmc.operations.admin.DeleteServer(
                    namespace,
                    podName
                )
            );
            log.info("Operation successful");
        } catch (Exception e) {
            log.error("Exception occur with message : [{}]", e.getMessage());
        }
    }
}