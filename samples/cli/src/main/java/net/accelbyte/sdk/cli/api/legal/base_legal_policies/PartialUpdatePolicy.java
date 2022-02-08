package net.accelbyte.sdk.cli.api.legal.base_legal_policies;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.legal.models.*;
import net.accelbyte.sdk.api.legal.wrappers.BaseLegalPolicies;
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

@Command(name = "partialUpdatePolicy", mixinStandardHelpOptions = true)
public class PartialUpdatePolicy implements Runnable {

    private static final Logger log = LogManager.getLogger(PartialUpdatePolicy.class);

    @Option(names = {"--basePolicyId"}, description = "basePolicyId")
    String basePolicyId;

    @Option(names = {"--body"}, description = "body")
    String body;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new PartialUpdatePolicy()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            UpdateBasePolicyResponse response =
            new BaseLegalPolicies(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .partialUpdatePolicy(
                new net.accelbyte.sdk.api.legal.operations.base_legal_policies.PartialUpdatePolicy(
                    basePolicyId,
                    new ObjectMapper().readValue(body, UpdateBasePolicyRequest.class)  
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