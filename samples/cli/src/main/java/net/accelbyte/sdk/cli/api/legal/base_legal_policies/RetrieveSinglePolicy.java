package net.accelbyte.sdk.cli.api.legal.base_legal_policies;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.legal.models.*;
import net.accelbyte.sdk.api.legal.wrappers.BaseLegalPolicies;
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

@Command(name = "retrieveSinglePolicy", mixinStandardHelpOptions = true)
public class RetrieveSinglePolicy implements Runnable {

    private static final Logger log = LogManager.getLogger(RetrieveSinglePolicy.class);

    @Option(names = {"--basePolicyId"}, description = "basePolicyId")
    String basePolicyId;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new RetrieveSinglePolicy()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            RetrieveBasePolicyResponse response =
            new BaseLegalPolicies(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new ConfigRepositoryImpl()
                    ))

            .retrieveSinglePolicy(
                new net.accelbyte.sdk.api.legal.operations.base_legal_policies.RetrieveSinglePolicy(
                    basePolicyId
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