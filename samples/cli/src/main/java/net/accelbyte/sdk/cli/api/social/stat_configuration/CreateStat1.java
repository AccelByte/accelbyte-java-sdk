package net.accelbyte.sdk.cli.api.social.stat_configuration;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.social.models.*;
import net.accelbyte.sdk.api.social.wrappers.StatConfiguration;
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

@Command(name = "createStat1", mixinStandardHelpOptions = true)
public class CreateStat1 implements Runnable {

    private static final Logger log = LogManager.getLogger(CreateStat1.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--body"}, description = "body")
    String body;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new CreateStat1()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            StatInfo response =
            new StatConfiguration(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .createStat1(
                new net.accelbyte.sdk.api.social.operations.stat_configuration.CreateStat1(
                    namespace,
                    new ObjectMapper().readValue(body, StatCreate.class)  
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