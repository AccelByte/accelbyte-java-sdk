package net.accelbyte.sdk.cli.api.iam.third_party_credential;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.wrappers.ThirdPartyCredential;
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

@Command(name = "retrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3", mixinStandardHelpOptions = true)
public class RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3 implements Runnable {

    private static final Logger log = LogManager.getLogger(RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            List<ModelPublicThirdPartyPlatformInfo> response =
            new ThirdPartyCredential(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .retrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3(
                new net.accelbyte.sdk.api.iam.operations.third_party_credential.RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3(
                    namespace
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