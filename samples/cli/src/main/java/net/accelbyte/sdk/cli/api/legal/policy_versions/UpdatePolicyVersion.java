package net.accelbyte.sdk.cli.api.legal.policy_versions;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.legal.models.*;
import net.accelbyte.sdk.api.legal.wrappers.PolicyVersions;
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

@Command(name = "updatePolicyVersion", mixinStandardHelpOptions = true)
public class UpdatePolicyVersion implements Runnable {

    private static final Logger log = LogManager.getLogger(UpdatePolicyVersion.class);

    @Option(names = {"--policyVersionId"}, description = "policyVersionId")
    String policyVersionId;

    @Option(names = {"--body"}, description = "body")
    String body;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new UpdatePolicyVersion()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            UpdatePolicyVersionResponse response =
            new PolicyVersions(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .updatePolicyVersion(
                new net.accelbyte.sdk.api.legal.operations.policy_versions.UpdatePolicyVersion(
                    policyVersionId,
                    new ObjectMapper().readValue(body, UpdatePolicyVersionRequest.class)  
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