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

@Command(name = "updateRootRegionOverride", mixinStandardHelpOptions = true)
public class UpdateRootRegionOverride implements Runnable {

    private static final Logger log = LogManager.getLogger(UpdateRootRegionOverride.class);

    @Option(names = {"--deployment"}, description = "deployment")
    String deployment;

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--region"}, description = "region")
    String region;

    @Option(names = {"--body"}, description = "body")
    String body;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new UpdateRootRegionOverride()).execute(args);
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

            .updateRootRegionOverride(
                new net.accelbyte.sdk.api.dsmc.operations.deployment_config.UpdateRootRegionOverride(
                    deployment,
                    namespace,
                    region,
                    new ObjectMapper().readValue(body, ModelsUpdateRegionOverrideRequest.class)  
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