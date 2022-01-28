package net.accelbyte.sdk.cli.api.legal.policy_versions;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.legal.models.*;
import net.accelbyte.sdk.api.legal.wrappers.PolicyVersions;
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

@Command(name = "retrieveSinglePolicyVersion", mixinStandardHelpOptions = true)
public class RetrieveSinglePolicyVersion implements Runnable {

    private static final Logger log = LogManager.getLogger(RetrieveSinglePolicyVersion.class);

    @Option(names = {"--policyId"}, description = "policyId")
    String policyId;

    @Option(names = {"--versionId"}, description = "versionId")
    String versionId;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new RetrieveSinglePolicyVersion()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            List<RetrievePolicyVersionResponse> response =
            new PolicyVersions(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new ConfigRepositoryImpl()
                    ))

            .retrieveSinglePolicyVersion(
                new net.accelbyte.sdk.api.legal.operations.policy_versions.RetrieveSinglePolicyVersion(
                    policyId,
                    versionId
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