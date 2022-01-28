package net.accelbyte.sdk.cli.api.legal.base_legal_policies;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.legal.models.*;
import net.accelbyte.sdk.api.legal.wrappers.BaseLegalPolicies;
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

@Command(name = "createPolicy", mixinStandardHelpOptions = true)
public class CreatePolicy implements Runnable {

    private static final Logger log = LogManager.getLogger(CreatePolicy.class);

    @Option(names = {"--body"}, description = "body")
    String body;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new CreatePolicy()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            CreateBasePolicyResponse response =
            new BaseLegalPolicies(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .createPolicy(
                new net.accelbyte.sdk.api.legal.operations.base_legal_policies.CreatePolicy(
                    new ObjectMapper().readValue(body, CreateBasePolicyRequest.class)  
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