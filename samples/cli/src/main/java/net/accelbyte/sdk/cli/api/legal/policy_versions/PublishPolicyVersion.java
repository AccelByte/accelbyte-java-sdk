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

@Command(name = "publishPolicyVersion", mixinStandardHelpOptions = true)
public class PublishPolicyVersion implements Runnable {

    private static final Logger log = LogManager.getLogger(PublishPolicyVersion.class);

    @Option(names = {"--policyVersionId"}, description = "policyVersionId")
    String policyVersionId;

    @Option(names = {"--shouldNotify"}, description = "shouldNotify")
    Boolean shouldNotify;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new PublishPolicyVersion()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            new PolicyVersions(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .publishPolicyVersion(
                new net.accelbyte.sdk.api.legal.operations.policy_versions.PublishPolicyVersion(
                    policyVersionId,
                    shouldNotify
                )
            );
            log.info("Operation successful");
        } catch (Exception e) {
            log.error("Exception occur with message : [{}]", e.getMessage());
        }
    }
}