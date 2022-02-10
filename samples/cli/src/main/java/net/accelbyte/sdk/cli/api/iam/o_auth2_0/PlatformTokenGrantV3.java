package net.accelbyte.sdk.cli.api.iam.o_auth2_0;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.wrappers.OAuth20;
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

@Command(name = "platformTokenGrantV3", mixinStandardHelpOptions = true)
public class PlatformTokenGrantV3 implements Callable<Integer> {

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
    public Integer call() {
        try {
            OauthmodelTokenResponse response =
            new OAuth20(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .platformTokenGrantV3(
                new net.accelbyte.sdk.api.iam.operations.o_auth2_0.PlatformTokenGrantV3(
                    platformId,
                    clientId != null ? clientId : null
                    ,
                    deviceId != null ? deviceId : null
                    ,
                    platformToken != null ? platformToken : null
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