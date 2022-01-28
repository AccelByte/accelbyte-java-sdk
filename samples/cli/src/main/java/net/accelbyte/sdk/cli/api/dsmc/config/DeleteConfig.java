package net.accelbyte.sdk.cli.api.dsmc.config;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.dsmc.models.*;
import net.accelbyte.sdk.api.dsmc.wrappers.Config;
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

@Command(name = "deleteConfig", mixinStandardHelpOptions = true)
public class DeleteConfig implements Runnable {

    private static final Logger log = LogManager.getLogger(DeleteConfig.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new DeleteConfig()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            new Config(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .deleteConfig(
                new net.accelbyte.sdk.api.dsmc.operations.config.DeleteConfig(
                    namespace
                )
            );
            log.info("Operation successful");
        } catch (Exception e) {
            log.error("Exception occur with message : [{}]", e.getMessage());
        }
    }
}