package net.accelbyte.sdk.cli.api.iam.third_party_credential;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.wrappers.ThirdPartyCredential;
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

@Command(name = "addThirdPartyLoginPlatformCredentialV3", mixinStandardHelpOptions = true)
public class AddThirdPartyLoginPlatformCredentialV3 implements Runnable {

    private static final Logger log = LogManager.getLogger(AddThirdPartyLoginPlatformCredentialV3.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--platformId"}, description = "platformId")
    String platformId;

    @Option(names = {"--body"}, description = "body")
    String body;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new AddThirdPartyLoginPlatformCredentialV3()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            ModelThirdPartyLoginPlatformCredentialResponse response =
            new ThirdPartyCredential(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .addThirdPartyLoginPlatformCredentialV3(
                new net.accelbyte.sdk.api.iam.operations.third_party_credential.AddThirdPartyLoginPlatformCredentialV3(
                    namespace,
                    platformId,
                    new ObjectMapper().readValue(body, ModelThirdPartyLoginPlatformCredentialRequest.class)  
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