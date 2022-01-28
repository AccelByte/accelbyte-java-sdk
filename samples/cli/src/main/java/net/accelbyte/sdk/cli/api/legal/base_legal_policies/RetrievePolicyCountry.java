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

@Command(name = "retrievePolicyCountry", mixinStandardHelpOptions = true)
public class RetrievePolicyCountry implements Runnable {

    private static final Logger log = LogManager.getLogger(RetrievePolicyCountry.class);

    @Option(names = {"--basePolicyId"}, description = "basePolicyId")
    String basePolicyId;

    @Option(names = {"--countryCode"}, description = "countryCode")
    String countryCode;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new RetrievePolicyCountry()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            RetrievePolicyResponse response =
            new BaseLegalPolicies(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new ConfigRepositoryImpl()
                    ))

            .retrievePolicyCountry(
                new net.accelbyte.sdk.api.legal.operations.base_legal_policies.RetrievePolicyCountry(
                    basePolicyId,
                    countryCode
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