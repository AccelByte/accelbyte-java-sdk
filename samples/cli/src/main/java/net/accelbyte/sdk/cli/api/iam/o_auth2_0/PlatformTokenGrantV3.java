package net.accelbyte.sdk.cli.api.iam.o_auth2_0;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.wrappers.OAuth20;
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

@Command(name = "platformTokenGrantV3", mixinStandardHelpOptions = true)
public class PlatformTokenGrantV3 implements Runnable {

    private static final Logger log = LogManager.getLogger(PlatformTokenGrantV3.class);

    @Option(names = {"--platformId"}, description = "platformId")
    String platformId;

    @Option(names = {"--clientId"}, description = "clientId")
    String clientId;

    @Option(names = {"--deviceId"}, description = "deviceId")
    String deviceId;

    @Option(names = {"--platformToken"}, description = "platformToken")
    String platformToken;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new PlatformTokenGrantV3()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            OauthmodelTokenResponse response =
            new OAuth20(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new ConfigRepositoryImpl()
                    ))

            .platformTokenGrantV3(
                new net.accelbyte.sdk.api.iam.operations.o_auth2_0.PlatformTokenGrantV3(
                    platformId,
                    clientId,
                    deviceId,
                    platformToken
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