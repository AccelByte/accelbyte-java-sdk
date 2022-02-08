package net.accelbyte.sdk.cli.api.iam.o_auth;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.wrappers.OAuth;
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

@Command(name = "platformTokenRequestHandler", mixinStandardHelpOptions = true)
public class PlatformTokenRequestHandler implements Runnable {

    private static final Logger log = LogManager.getLogger(PlatformTokenRequestHandler.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--platformId"}, description = "platformId")
    String platformId;

    @Option(names = {"--deviceId"}, description = "deviceId")
    String deviceId;

    @Option(names = {"--platformToken"}, description = "platformToken")
    String platformToken;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new PlatformTokenRequestHandler()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            OauthmodelTokenResponse response =
            new OAuth(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .platformTokenRequestHandler(
                new net.accelbyte.sdk.api.iam.operations.o_auth.PlatformTokenRequestHandler(
                    namespace,
                    platformId,
                    deviceId
                    ,
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