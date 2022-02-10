package net.accelbyte.sdk.cli.api.legal.policies;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.legal.models.*;
import net.accelbyte.sdk.api.legal.wrappers.Policies;
import net.accelbyte.sdk.cli.repository.CLITokenRepositoryImpl;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.ResponseException;
import net.accelbyte.sdk.core.client.OkhttpClient;
import net.accelbyte.sdk.core.repository.DefaultConfigRepository;
import org.apache.commons.io.FileUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import picocli.CommandLine;
import picocli.CommandLine.Command;
import picocli.CommandLine.Option;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;
import java.util.concurrent.Callable;

@Command(name = "retrieveLatestPolicies", mixinStandardHelpOptions = true)
public class RetrieveLatestPolicies implements Callable<Integer> {

    private static final Logger log = LogManager.getLogger(RetrieveLatestPolicies.class);

    @Option(names = {"--countryCode"}, description = "countryCode")
    String countryCode;

    @Option(names = {"--defaultOnEmpty"}, description = "defaultOnEmpty")
    Boolean defaultOnEmpty;

    @Option(names = {"--policyType"}, description = "policyType")
    String policyType;

    @Option(names = {"--tags"}, description = "tags")
    String tags;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new RetrieveLatestPolicies()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public Integer call() {
        try {
            List<RetrievePolicyPublicResponse> response =
            new Policies(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .retrieveLatestPolicies(
                new net.accelbyte.sdk.api.legal.operations.policies.RetrieveLatestPolicies(
                    countryCode,
                    defaultOnEmpty,
                    policyType,
                    tags
                )
            );
            log.info("Operation successful");
            String result = new ObjectMapper().writeValueAsString(response);
            log.info("result: [{}]", result);
            return 0;
        } catch (ResponseException e) {
            log.error("Response occur with message : [{}]", e.getMessage());
            System.err.print(e.getHttpCode());
        } catch (IOException e) {
            log.error("IOException occur with message : [{}]", e.getMessage());
        }
        return 1;
    }
}