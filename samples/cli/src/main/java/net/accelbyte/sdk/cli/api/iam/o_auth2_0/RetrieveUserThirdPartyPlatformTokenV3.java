package net.accelbyte.sdk.cli.api.iam.o_auth2_0;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.wrappers.OAuth20;
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

@Command(name = "retrieveUserThirdPartyPlatformTokenV3", mixinStandardHelpOptions = true)
public class RetrieveUserThirdPartyPlatformTokenV3 implements Runnable {

    private static final Logger log = LogManager.getLogger(RetrieveUserThirdPartyPlatformTokenV3.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--platformId"}, description = "platformId")
    String platformId;

    @Option(names = {"--userId"}, description = "userId")
    String userId;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new RetrieveUserThirdPartyPlatformTokenV3()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            OauthmodelTokenThirdPartyResponse response =
            new OAuth20(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .retrieveUserThirdPartyPlatformTokenV3(
                new net.accelbyte.sdk.api.iam.operations.o_auth2_0.RetrieveUserThirdPartyPlatformTokenV3(
                    namespace,
                    platformId,
                    userId
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