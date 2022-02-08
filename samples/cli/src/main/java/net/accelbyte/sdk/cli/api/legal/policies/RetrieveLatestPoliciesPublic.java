package net.accelbyte.sdk.cli.api.legal.policies;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.legal.models.*;
import net.accelbyte.sdk.api.legal.wrappers.Policies;
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

@Command(name = "retrieveLatestPoliciesPublic", mixinStandardHelpOptions = true)
public class RetrieveLatestPoliciesPublic implements Runnable {

    private static final Logger log = LogManager.getLogger(RetrieveLatestPoliciesPublic.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--alwaysIncludeDefault"}, description = "alwaysIncludeDefault")
    Boolean alwaysIncludeDefault;

    @Option(names = {"--defaultOnEmpty"}, description = "defaultOnEmpty")
    Boolean defaultOnEmpty;

    @Option(names = {"--policyType"}, description = "policyType")
    String policyType;

    @Option(names = {"--tags"}, description = "tags")
    String tags;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new RetrieveLatestPoliciesPublic()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            List<RetrievePolicyPublicResponse> response =
            new Policies(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .retrieveLatestPoliciesPublic(
                new net.accelbyte.sdk.api.legal.operations.policies.RetrieveLatestPoliciesPublic(
                    namespace,
                    alwaysIncludeDefault,
                    defaultOnEmpty,
                    policyType,
                    tags
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