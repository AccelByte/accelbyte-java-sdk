package net.accelbyte.sdk.cli.api.legal.policies;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.legal.models.*;
import net.accelbyte.sdk.api.legal.wrappers.Policies;
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

@Command(name = "updatePolicy", mixinStandardHelpOptions = true)
public class UpdatePolicy implements Runnable {

    private static final Logger log = LogManager.getLogger(UpdatePolicy.class);

    @Option(names = {"--policyId"}, description = "policyId")
    String policyId;

    @Option(names = {"--body"}, description = "body")
    String body;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new UpdatePolicy()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            new Policies(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new ConfigRepositoryImpl()
                    ))

            .updatePolicy(
                new net.accelbyte.sdk.api.legal.operations.policies.UpdatePolicy(
                    policyId,
                    new ObjectMapper().readValue(body, UpdatePolicyRequest.class)  
                )
            );
            log.info("Operation successful");
        } catch (Exception e) {
            log.error("Exception occur with message : [{}]", e.getMessage());
        }
    }
}