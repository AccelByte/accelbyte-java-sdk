package net.accelbyte.sdk.cli.api.dsmc.deployment_config;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.dsmc.models.*;
import net.accelbyte.sdk.api.dsmc.wrappers.DeploymentConfig;
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

@Command(name = "updateDeploymentOverride", mixinStandardHelpOptions = true)
public class UpdateDeploymentOverride implements Runnable {

    private static final Logger log = LogManager.getLogger(UpdateDeploymentOverride.class);

    @Option(names = {"--deployment"}, description = "deployment")
    String deployment;

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--version"}, description = "version")
    String version;

    @Option(names = {"--body"}, description = "body")
    String body;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new UpdateDeploymentOverride()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            ModelsDeploymentWithOverride response =
            new DeploymentConfig(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .updateDeploymentOverride(
                new net.accelbyte.sdk.api.dsmc.operations.deployment_config.UpdateDeploymentOverride(
                    deployment,
                    namespace,
                    version,
                    new ObjectMapper().readValue(body, ModelsUpdateDeploymentOverrideRequest.class)  
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