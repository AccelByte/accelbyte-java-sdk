package net.accelbyte.sdk.cli.api.group.configuration;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.group.models.*;
import net.accelbyte.sdk.api.group.wrappers.Configuration;
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

@Command(name = "updateGroupConfigurationAdminV1", mixinStandardHelpOptions = true)
public class UpdateGroupConfigurationAdminV1 implements Runnable {

    private static final Logger log = LogManager.getLogger(UpdateGroupConfigurationAdminV1.class);

    @Option(names = {"--configurationCode"}, description = "configurationCode")
    String configurationCode;

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--body"}, description = "body")
    String body;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new UpdateGroupConfigurationAdminV1()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            ModelsUpdateGroupConfigurationResponseV1 response =
            new Configuration(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .updateGroupConfigurationAdminV1(
                new net.accelbyte.sdk.api.group.operations.configuration.UpdateGroupConfigurationAdminV1(
                    configurationCode,
                    namespace,
                    new ObjectMapper().readValue(body, ModelsUpdateGroupConfigurationRequestV1.class)  
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