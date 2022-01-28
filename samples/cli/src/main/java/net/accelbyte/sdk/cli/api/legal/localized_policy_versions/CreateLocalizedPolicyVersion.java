package net.accelbyte.sdk.cli.api.legal.localized_policy_versions;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.legal.models.*;
import net.accelbyte.sdk.api.legal.wrappers.LocalizedPolicyVersions;
import net.accelbyte.sdk.cli.repository.CLITokenRepositoryImpl;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.client.OkhttpClient;
import net.accelbyte.sdk.core.repository.ConfigRepositoryImpl;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import picocli.CommandLine;
import picocli.CommandLine.Command;
import picocli.CommandLine.Option;

import java.io.InputStream;
import java.util.*;

@Command(name = "createLocalizedPolicyVersion", mixinStandardHelpOptions = true)
public class CreateLocalizedPolicyVersion implements Runnable {

    private static final Logger log = LogManager.getLogger(CreateLocalizedPolicyVersion.class);

    @Option(names = {"--policyVersionId"}, description = "policyVersionId")
    String policyVersionId;

    @Option(names = {"--body"}, description = "body")
    String body;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new CreateLocalizedPolicyVersion()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            CreateLocalizedPolicyVersionResponse response =
            new LocalizedPolicyVersions(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new ConfigRepositoryImpl()
                    ))

            .createLocalizedPolicyVersion(
                new net.accelbyte.sdk.api.legal.operations.localized_policy_versions.CreateLocalizedPolicyVersion(
                    policyVersionId,
                    new ObjectMapper().readValue(body, CreateLocalizedPolicyVersionRequest.class)  
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