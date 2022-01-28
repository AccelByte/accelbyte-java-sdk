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

@Command(name = "listConfig", mixinStandardHelpOptions = true)
public class ListConfig implements Runnable {

    private static final Logger log = LogManager.getLogger(ListConfig.class);


    public static void main(String[] args) {
            int exitCode = new CommandLine(new ListConfig()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            ModelsListConfigResponse response =
            new Config(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .listConfig(
                new net.accelbyte.sdk.api.dsmc.operations.config.ListConfig(
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