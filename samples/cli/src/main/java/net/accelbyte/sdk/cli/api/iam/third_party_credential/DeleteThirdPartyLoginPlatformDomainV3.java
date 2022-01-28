package net.accelbyte.sdk.cli.api.iam.third_party_credential;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.wrappers.ThirdPartyCredential;
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

@Command(name = "deleteThirdPartyLoginPlatformDomainV3", mixinStandardHelpOptions = true)
public class DeleteThirdPartyLoginPlatformDomainV3 implements Runnable {

    private static final Logger log = LogManager.getLogger(DeleteThirdPartyLoginPlatformDomainV3.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--platformId"}, description = "platformId")
    String platformId;

    @Option(names = {"--body"}, description = "body")
    String body;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new DeleteThirdPartyLoginPlatformDomainV3()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            new ThirdPartyCredential(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new ConfigRepositoryImpl()
                    ))

            .deleteThirdPartyLoginPlatformDomainV3(
                new net.accelbyte.sdk.api.iam.operations.third_party_credential.DeleteThirdPartyLoginPlatformDomainV3(
                    namespace,
                    platformId,
                    new ObjectMapper().readValue(body, ModelPlatformDomainDeleteRequest.class)  
                )
            );
            log.info("Operation successful");
        } catch (Exception e) {
            log.error("Exception occur with message : [{}]", e.getMessage());
        }
    }
}